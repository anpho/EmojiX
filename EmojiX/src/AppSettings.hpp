/* Copyright (c) 2012 Research In Motion Limited.
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

#ifndef APPSETTINGS_HPP
#define APPSETTINGS_HPP

#include <QObject>
/**
 * AppSettings
 *
 * In this class you will learn the following:
 * -- How to use QSettings to store and retrieve settings for your App
 */
class AppSettings {
public:
	/*
	 * Retrieves the https settings flag saved in the QSettings db
	 */
	static void saveValueFor(const QString &objectName, const QString &inputValue);
	Q_INVOKABLE static QString getValueFor(const QString &objectName, const QString &defaultValue);
};

#endif
