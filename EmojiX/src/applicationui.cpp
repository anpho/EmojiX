/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>
#include <bb/system/SystemToast>
#include "AppSettings.hpp"
#include "clipboard/clipboard.h"

using namespace bb::cascades;
using namespace bb::system;
ApplicationUI::ApplicationUI() :
        QObject()
{

    // prepare the localization
    m_pTranslator = new QTranslator(this);
    m_pLocaleHandler = new LocaleHandler(this);

    bool res = QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()), this,
            SLOT(onSystemLanguageChanged()));
    // This is only available in Debug builds
    Q_ASSERT(res);
    // Since the variable is not used in the app, this is added to avoid a
    // compiler warning
    Q_UNUSED(res);

    // initial load
    onSystemLanguageChanged();

    // Create scene document from main.qml asset, the parent is set
    // to ensure the document gets destroyed properly at shut down.
    QmlDocument *qml = QmlDocument::create("asset:///menu.qml").parent(this);
    qml->setContextProperty("_app", this);
    // Create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // Set created root object as the application scene
    Application::instance()->setScene(root);
}

void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);
    // Initiate, load and install the application translation files.
    QString locale_string = QLocale().name();
    QString file_name = QString("EmojiX_%1").arg(locale_string);
    if (m_pTranslator->load(file_name, "app/native/qm")) {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}

void ApplicationUI::setValue(QString field, QString input)
{
    AppSettings::saveValueFor(field, input);
}

QString ApplicationUI::getValue(QString input, QString def)
{
    QString result = AppSettings::getValueFor(input, def);
    return result;
}

void ApplicationUI::setTextToClipboard(QString text)
{
    setTextToClipboardWithoutHistory(text);
    //write history
    QString histories = getValue("history", "");
    if (histories.length() > 0) {
        histories.append("   ").append(text);
    } else {
        histories = text;
    }
    setValue("history", histories);
    //end write history
}

void ApplicationUI::setTextToClipboardWithoutHistory(QString text)
{
    QByteArray ba = text.toLocal8Bit();

    if (get_clipboard_can_write() == 0) {
        empty_clipboard();
        int ret = set_clipboard_data("text/plain", ba.length(), ba.data());
        if (ret > 0) {
            SystemToast *toast = new SystemToast(this);
            QString message = trUtf8("Copied to clipboard.");
            toast->setBody(message);

            toast->setIcon(QUrl("asset:///icon/ic_done.png"));
            toast->setPosition(SystemUiPosition::MiddleCenter);
            toast->show();
            if (getValue("auto_min", "0") == "1") {
                Application::instance()->minimize();
            }
        }
    }
}
