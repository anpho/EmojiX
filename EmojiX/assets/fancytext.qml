import bb.cascades 1.0

Page {
   
    titleBar: TitleBar {
        title: qsTr("Fancy Text") + Retranslate.onLocaleOrLanguageChanged
        scrollBehavior: TitleBarScrollBehavior.NonSticky
    }
    actions: [
        ActionItem {
            ActionBar.placement: ActionBarPlacement.Signature
            title: qsTr("I'm Lucky")+ Retranslate.onLocaleOrLanguageChanged
            imageSource: "asset:///icon/wand.png"
            onTriggered: {
                randomize()
            }
        }
    ]
    actionBarVisibility: ChromeVisibility.Compact
    ScrollView {
        Container {
            Header {
                title: qsTr("Original Text")+ Retranslate.onLocaleOrLanguageChanged
            }
            TextArea {
                id: itext
                hintText: qsTr("Enter your text here")+ Retranslate.onLocaleOrLanguageChanged
                onTextChanging: {
                    changehandler();
                }

            }
            Header {
                title: qsTr("Fancy Text")+ Retranslate.onLocaleOrLanguageChanged
                subtitle: qsTr("Tap to copy")+ Retranslate.onLocaleOrLanguageChanged
            }
            TextArea {
                hintText: qsTr("Your fancy text would be displayed here.")+ Retranslate.onLocaleOrLanguageChanged
                editable: false
                id: otext
                gestureHandlers: TapHandler {
                    onTapped: {
                        if (otext.text.length > 0)
                            _app.setTextToClipboard(otext.text)
                    }
                }
            }
            Header {
                title: qsTr("Options")+ Retranslate.onLocaleOrLanguageChanged
            }
            DropDown {
                id: oLetters
                title: qsTr("Letters")+ Retranslate.onLocaleOrLanguageChanged
                onSelectedValueChanged: {
                    changehandler();
                }
                options: [
                    Option {
                        value: "set0"
                        text: qsTr("Unchanged")+ Retranslate.onLocaleOrLanguageChanged
                        selected: true
                    },
                    Option {
                        value: "set1"
                        text: "αв¢∂єƒg"
                    },
                    Option {
                        value: "set2"
                        text: "ΛBᄃDΣFG"
                    },
                    Option {
                        value: "set3"
                        text: "ÁßČĎĔŦĞ"

                    },
                    Option {
                        value: "set4"
                        text: "äbċdëfġ"

                    },
                    Option {
                        value: "set5"
                        text: "ค๒ς๔єŦﻮ"

                    },
                    Option {
                        value: "set6"
                        text: "åß¢Ðê£g"

                    },
                    Option {
                        value: "set7"
                        text: qsTr("Circled Letters")

                    }
                ]
            }
            DropDown {
                id: oNumbers
                title: qsTr("Numbers")+ Retranslate.onLocaleOrLanguageChanged
                onSelectedValueChanged: {
                    changehandler();
                }
                options: [
                    Option {
                        value: "set0"
                        text: qsTr("Unchanged")+ Retranslate.onLocaleOrLanguageChanged
                        selected: true
                    },
                    Option {
                        value: "set1"
                        text: "➉➀➁➂➃➄➅➆➇➈"
                    },
                    Option {
                        value: "set2"
                        text: "⓾⓵⓶⓷⓸⓹⓺⓻⓼⓽"
                    },
                    Option {
                        value: "set3"
                        text: "➓➊➋➌➍➎➏➐➑➒"

                    },
                    Option {
                        value: "set4"
                        text: qsTr("superscript")

                    },
                    Option {
                        value: "set5"
                        text: qsTr("subscript")

                    },
                    Option {
                        value: "set6"
                        text: "⑽⑴⑵⑶⑷⑸⑹⑺⑻⑼"

                    },
                    Option {
                        value: "set7"
                        text: "〇㈠㈡㈢㈣㈤㈥㈦㈧㈨"

                    },
                    Option {
                        value: "set8"
                        text: "〇一二三四五六七八九"

                    },
                    Option {
                        value: "set9"
                        text: "零壹贰叁肆伍陆柒捌玖"

                    }
                ]
            }
        }
    }
    property variant ft: {
        letter: {
            set0: "abcdefghijklmnopqrstuvwxyz",
            set1: "αв¢∂єƒgнιנкℓмησρqяѕтυνωχуz",
            set2: "ΛBᄃDΣFGΉIJKᄂMПӨPQЯƧƬЦVЩXYZ",
            set3: "ÁßČĎĔŦĞĤĨĴĶĹMŃŐPQŔŚŤÚVŴЖŶŹ",
            set4: "äbċdëfġhïjklmnöpqrstüvwxÿż",
            set5: "ค๒ς๔єŦﻮђเןкl๓ภ๏קợгรtยשฬאץz",
            set6: "åß¢Ðê£ghïjklmñðþqr§†µvwx¥z",
            set7: "ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ"
        },
        number: {
            set0: "0123456789",
            set1: "➉➀➁➂➃➄➅➆➇➈",
            set2: "⓾⓵⓶⓷⓸⓹⓺⓻⓼⓽",
            set3: "➓➊➋➌➍➎➏➐➑➒",
            set4: "\u2070\u00b9\u00b2\u00b3\u2074\u2075\u2076\u2077\u2078\u2079\u0022",
            set5: "\u2080\u2081\u2082\u2083\u2084\u2085\u2086\u2087\u2088\u2089",
            set6: "⑽⑴⑵⑶⑷⑸⑹⑺⑻⑼",
            set7: "〇㈠㈡㈢㈣㈤㈥㈦㈧㈨",
            set8: "〇一二三四五六七八九",
            set9: "零壹贰叁肆伍陆柒捌玖"
        },
        random: {
            a: "\u1e00\u1e01\u1f00\u1f01\u1f02\u1f03\u1f04\u1f05\u1f06\u1f07\u1f08\u1f09\u1f0a\u1f0b\u1f0c\u1f0d\u1f0e\u1f0f\u1ea0\u1ea1\u1ea2\u1ea3\u1ea4\u1ea5\u1ea6\u1ea7\u1ea8\u1ea9\u1eaa\u1eab\u1eac\u1ead\u1eae\u1eaf\u1eb0\u1eb1\u1eb2\u1eb3\u1eb4\u1eb5\u1eb6\u1eb7\u1e9a\u1fb0\u1fb1\u1fb2\u1fb3\u1fb4\u1fb6\u1fb7\u1fb8\u1fb9\u1fba\u1fbb\u1fbc\u1f70\u1f71\u1f80\u1f81\u1f82\u1f83\u1f84\u1f85\u1f86\u1f87\u1f88\u1f89\u1f8a\u1f8b\u1f8c\u1f8d\u1f8e\u1f8f\u0259",
            b: "ḂḃḄḅḆḇ",
            c: "Ḉḉ",
            d: "ḊḋḌḍḎḏḐḑḒḓ",
            e: "\u1e14\u1e15\u1e16\u1e17\u1e18\u1e19\u1e1a\u1e1b\u1e1c\u1e1d\u1eb8\u1eb9\u1eba\u1ebb\u1ebc\u1ebd\u1ebe\u1ebf\u1ec0\u1ec1\u1ec2\u1ec3\u1ec4\u1ec5\u1ec6\u1ec7\u1fc8\u1fc9\u1f10\u1f11\u1f12\u1f13\u1f14\u1f15\u1f18\u1f19\u1f1a\u1f1b\u1f1c\u1f1d\u1f72\u1f73",
            f: "Ḟḟ",
            g: "Ḡḡ",
            h: "\u1e22\u1e23\u1e24\u1e25\u1e26\u1e27\u1e28\u1e29\u1e2a\u1e2b\u1e96\u1f28\u0126\u1f29\u1f2a\u1f2b\u1f2c\u1f2d\u1f2e\u1f2f\u1f98\u1f99\u1f9a\u1f9b\u1f9c\u1f9d\u1f9e\u1f9f\u1fca\u1fcb\u1fcc",
            i: "\u1e2c\u1e2d\u1e2e\u1e2f\u1ec8\u1ec9\u1eca\u1ecb\u1f30\u1f31\u1f32\u1f33\u1f34\u1f35\u1f36\u1f37\u1f38\u1f39\u1f3a\u1f3b\u1f3c\u1f3d\u1f3e\u1f3f\u1fd0\u1fd1\u1fd2\u1fd3\u1fd6\u1fd7\u1fd8\u1fd9\u1fda\u1fdb\u1f76\u1f77",
            j: "j",
            k: "\u1e30\u1e31\u1e32\u1e33\u1e34\u1e35",
            l: "\u1e36\u1e37\u1e38\u1e39\u1e3a\u1e3b\u1e3c\u1e3d",
            m: "\u1e3e\u1e3f\u1e40\u1e41\u1e42\u1e43",
            n: "\u1e44\u1e45\u1e46\u1e47\u1e48\u1e49\u1e4a\u1e4b\u1f20\u1f21\u1f22\u1f23\u1f24\u1f25\u1f26\u1f27\u1f74\u1f75\u1f90\u1f91\u1f92\u1f93\u1f94\u1f95\u1f96\u1f97\u1fc2\u1fc3\u1fc4\u1fc6\u1fc7",
            o: "\u1e4c\u1e4d\u1e4e\u1e4f\u1e50\u1e51\u1e52\u1e53\u1ecc\u1ecd\u1ece\u1ecf\u1ed0\u1ed1\u1ed2\u1ed3\u1ed4\u1ed5\u1ed6\u1ed7\u1ed8\u1ed9\u1eda\u1edb\u1edc\u1edd\u1ede\u1edf\u1ee0\u1ee1\u1ee2\u1ee3\u1f40\u1f41\u1f42\u1f43\u1f44\u1f45\u1f48\u1f49\u1f4a\u1f4b\u1f4c\u1f4d\u1f68\u1f69\u1f6a\u1f6b\u1f6c\u1f6d\u1f6e\u1f6f\u1f78\u1f79\u1fa8\u1fa9\u1faa\u1fab\u1fac\u1fad\u1fae\u1faf\u1ff8\u1ff9\u1ffa\u1ffb\u1ffc",
            p: "\u1e54\u1e55\u1e56\u1e57\u1fe5\u1fe4\u1fec",
            q: "\u01ec\u01ed",
            r: "\u1e58\u1e59\u1e5a\u1e5b\u1e5c\u1e5d\u1e5e\u1e5f",
            s: "\u1e60\u1e61\u1e62\u1e63\u1e64\u1e65\u1e66\u1e67\u1e68\u1e69\u015f",
            t: "\u1e6a\u1e6b\u1e6c\u1e6d\u1e6e\u1e6f\u1e70\u1e71\u1e97",
            u: "\u1e72\u1e73\u1e74\u1e75\u1e76\u1e77\u1e78\u1e79\u1e7a\u1e7b\u1ee4\u1ee5\u1ee6\u1ee7\u1ee8\u1ee9\u1eea\u1eeb\u1eec\u1eed\u1eee\u1eef\u1ef0\u1ef1\u1f50\u1f51\u1f52\u1f53\u1f54\u1f55\u1f56\u1f57\u1f7a\u1f7b\u1fe0\u1fe1\u1fe2\u1fe3\u1fe6\u1fe7",
            v: "\u1e7c\u1e7d\u1e7e\u1e7f",
            w: "\u1e80\u1e81\u1e82\u1e83\u1e84\u1e85\u1e86\u1e87\u1e88\u1e89\u1e98\u1f60\u1f61\u1f62\u1f63\u1f64\u1f65\u1f66\u1f67\u1f7c\u1f7d\u1fa0\u1fa1\u1fa2\u1fa3\u1fa4\u1fa5\u1fa6\u1fa7\u1ff2\u1ff3\u1ff4\u1ff6\u1ff7",
            x: "\u1e8a\u1e8b\u1e8c\u1e8d",
            y: "\u1e8e\u1e8f\u1e99\u1f59\u1f5b\u1f5d\u1f5f\u1fe8\u1fe9\u1fea\u1feb\u1ef2\u1ef3\u1ef4\u1ef5\u1ef6\u1ef7\u1ef8\u1ef9",
            z: "\u1e90\u1e91\u1e92\u1e93\u1e94\u1e95"
        }
    }
    function process(str, _let, _num) {
        var _letter_ = ft.letter[_let];
        var _number_ = ft.number[_num];
        var _result = str.toLowerCase();
        var result = [];
        for (var i = 0; i < _result.length; i ++) {
            var code = _result.charCodeAt(i);
            if (code > 96 && code < 123) {
                _result[i] = _letter_[code - 97];
                result.push(_letter_[code - 97]);
            } else if (code > 47 && code < 58) {
                _result[i] = _number_[code - 48];
                result.push(_number_[code - 48]);
            } else {
                result.push(_result[i]);
            }
        }
        console.log(_result);
        console.log(result);
        return result.join("");
    }
    function ran(str) {
        return str[Math.floor(Math.random() * str.length)];
    }
    function getRandomStr(str, _num) {
        var _result = str.toLowerCase();
        var _number_ = ft.number[_num];
        var result = [];
        for (var i = 0; i < _result.length; i ++) {
            var code = _result.charCodeAt(i);
            if (code > 96 && code < 123) {
                _result[i] = this.ran(ft.random[_result[i]]);
                result.push(this.ran(ft.random[_result[i]]));
            } else if (code > 47 && code < 58) {
                result.push(_number_[code - 48]);
            } else {
                result.push(_result[i]);
            }
        }
        return result.join("");
    }
    
    function changehandler() {
        var it = itext.text;
        var ol = oLetters.selectedValue;
        var onum = oNumbers.selectedValue;
        otext.text = process(it, ol, onum);
    }
    function randomize() {
        var it = itext.text;
        var onum = oNumbers.selectedValue;
        otext.text = getRandomStr(it, onum)
    }
}
