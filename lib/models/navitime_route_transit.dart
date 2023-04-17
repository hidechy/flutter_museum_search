// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls, inference_failure_on_collection_literal

/*
https://navitime-route-totalnavi.p.rapidapi.com/route_transit?start=35.665251%2C139.712092&goal=35.718571,139.5870214&start_time=2020-08-19T10%3A00%3A00&datum=wgs84&term=1440&limit=5&coord_unit=degree

https://navitime-route-totalnavi.p.rapidapi.com/route_transit
?start=35.665251%2C139.712092
&goal=35.718571,139.5870214
&start_time=2020-08-19T10%3A00%3A00
&datum=wgs84
&term=1440
&limit=5
&coord_unit=degree



X-RapidAPI-Host
navitime-route-totalnavi.p.rapidapi.com

X-RapidAPI-Key
e7737991e9mshe2f9b08fce63cddp186074jsn686b1f74dc33



{
    "items": [
        {
            "summary": {
                "no": "1",
                "start": {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                "goal": {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                },
                "move": {
                    "transit_count": 2,
                    "walk_distance": 1729,
                    "fare": {
                        "unit_0": 540.0,
                        "unit_48": 535.0,
                        "unit_128_train": 19110.0,
                        "unit_130_train": 54490.0,
                        "unit_133_train": 100240.0
                    },
                    "type": "move",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T11:03:00+09:00",
                    "time": 63,
                    "distance": 18329,
                    "move_type": [
                        "local_train",
                        "rapid_train",
                        "walk"
                    ]
                }
            },
            "sections": [
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T10:02:00+09:00",
                    "time": 2,
                    "distance": 143,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665231,
                        "lon": 139.712
                    },
                    "name": "表参道",
                    "node_id": "00007820",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "B4口",
                    "numbering": {
                        "departure": [
                            {
                                "symbol": "C",
                                "number": "04"
                            }
                        ]
                    }
                },
                {
                    "next_transit": true,
                    "transport": {
                        "fare": {
                            "unit_0": 170.0,
                            "unit_48": 168.0,
                            "unit_128": 6260.0,
                            "unit_130": 17850.0,
                            "unit_133": 33810.0,
                            "unit_136": 2870.0,
                            "unit_138": 8180.0,
                            "unit_141": 15500.0
                        },
                        "getoff": "2・5",
                        "color": "#00BB85",
                        "name": "東京メトロ千代田線",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000113",
                            "name": "東京地下鉄（メトロ）"
                        },
                        "links": [
                            {
                                "id": "00000769",
                                "name": "東京メトロ千代田線",
                                "direction": "up",
                                "destination": {
                                    "name": "代々木上原",
                                    "id": "00005508"
                                },
                                "from": {
                                    "name": "表参道",
                                    "id": "00007820"
                                },
                                "to": {
                                    "name": "明治神宮前",
                                    "id": "00008598"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000566",
                        "type": "普通",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00008598",
                                    "name": "明治神宮前"
                                },
                                "fare": 170.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00008598",
                                    "name": "明治神宮前"
                                },
                                "fare": 168.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00008598",
                                    "name": "明治神宮前"
                                },
                                "fare": 6260.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00008598",
                                    "name": "明治神宮前"
                                },
                                "fare": 17850.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00008598",
                                    "name": "明治神宮前"
                                },
                                "fare": 33810.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00008598",
                                    "name": "明治神宮前"
                                },
                                "fare": 2870.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00008598",
                                    "name": "明治神宮前"
                                },
                                "fare": 8180.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00008598",
                                    "name": "明治神宮前"
                                },
                                "fare": 15500.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "local_train",
                    "from_time": "2020-08-19T10:05:00+09:00",
                    "to_time": "2020-08-19T10:07:00+09:00",
                    "time": 2,
                    "distance": 900,
                    "line_name": "東京メトロ千代田線"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.670034,
                        "lon": 139.702761
                    },
                    "name": "明治神宮前",
                    "node_id": "00008598",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "2番口",
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "C",
                                "number": "03"
                            }
                        ]
                    }
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:07:00+09:00",
                    "to_time": "2020-08-19T10:12:00+09:00",
                    "time": 5,
                    "distance": 256,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.669957,
                        "lon": 139.702748
                    },
                    "name": "原宿",
                    "node_id": "00002128",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "東口",
                    "numbering": {
                        "departure": [
                            {
                                "symbol": "JY",
                                "number": "19"
                            }
                        ]
                    }
                },
                {
                    "next_transit": true,
                    "transport": {
                        "fare": {
                            "unit_0": 160.0,
                            "unit_48": 157.0,
                            "unit_128": 4940.0,
                            "unit_130": 14090.0,
                            "unit_133": 23710.0,
                            "unit_136": 2940.0,
                            "unit_138": 8390.0,
                            "unit_141": 15890.0,
                            "unit_144": 2640.0,
                            "unit_146": 7550.0,
                            "unit_149": 14300.0,
                            "unit_152": 2050.0,
                            "unit_154": 5870.0,
                            "unit_157": 11120.0
                        },
                        "getoff": "中",
                        "color": "#80C241",
                        "name": "ＪＲ山手線",
                        "fare_season": "busy",
                        "company": {
                            "id": "00000004",
                            "name": "ＪＲ東日本"
                        },
                        "links": [
                            {
                                "id": "00000141",
                                "name": "ＪＲ山手線",
                                "direction": "down",
                                "destination": {
                                    "name": "新宿",
                                    "id": "00004254"
                                },
                                "from": {
                                    "name": "原宿",
                                    "id": "00002128"
                                },
                                "to": {
                                    "name": "高田馬場",
                                    "id": "00002616"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000330",
                        "type": "普通",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true,
                            "unit_144": true,
                            "unit_146": true,
                            "unit_149": true,
                            "unit_152": true,
                            "unit_154": true,
                            "unit_157": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 160.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 157.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 4940.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 14090.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 23710.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 2940.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 8390.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 15890.0,
                                "id": "141"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 2640.0,
                                "id": "144"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 7550.0,
                                "id": "146"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 14300.0,
                                "id": "149"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 2050.0,
                                "id": "152"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 5870.0,
                                "id": "154"
                            },
                            {
                                "start": {
                                    "node_id": "00002128",
                                    "name": "原宿"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 11120.0,
                                "id": "157"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "local_train",
                    "from_time": "2020-08-19T10:14:00+09:00",
                    "to_time": "2020-08-19T10:23:00+09:00",
                    "time": 9,
                    "distance": 4900,
                    "line_name": "ＪＲ山手線",
                    "transfer_seconds": 180
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.712633,
                        "lon": 139.703849
                    },
                    "name": "高田馬場",
                    "node_id": "00002616",
                    "node_types": [
                        "station"
                    ],
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "JY",
                                "number": "15"
                            }
                        ],
                        "departure": [
                            {
                                "symbol": "SS",
                                "number": "02"
                            }
                        ]
                    }
                },
                {
                    "transport": {
                        "fare": {
                            "unit_0": 210.0,
                            "unit_48": 210.0,
                            "unit_128": 7910.0,
                            "unit_130": 22550.0,
                            "unit_133": 42720.0,
                            "unit_136": 2810.0,
                            "unit_138": 8010.0,
                            "unit_141": 15180.0
                        },
                        "getoff": "前・中",
                        "color": "#0099CC",
                        "name": "西武新宿線急行",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000092",
                            "name": "西武鉄道"
                        },
                        "links": [
                            {
                                "id": "00000721",
                                "name": "西武新宿線",
                                "direction": "down",
                                "destination": {
                                    "name": "所沢",
                                    "id": "00003610"
                                },
                                "from": {
                                    "name": "高田馬場",
                                    "id": "00002616"
                                },
                                "to": {
                                    "name": "上石神井",
                                    "id": "00003987"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000487",
                        "type": "快速",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 210.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 210.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 7910.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 22550.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 42720.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 2810.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 8010.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 15180.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "rapid_train",
                    "from_time": "2020-08-19T10:33:00+09:00",
                    "to_time": "2020-08-19T10:45:00+09:00",
                    "time": 12,
                    "distance": 10800,
                    "line_name": "西武新宿線急行"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.726082,
                        "lon": 139.591758
                    },
                    "name": "上石神井",
                    "node_id": "00003987",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "南口",
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "SS",
                                "number": "13"
                            }
                        ]
                    }
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:45:00+09:00",
                    "to_time": "2020-08-19T11:03:00+09:00",
                    "time": 18,
                    "distance": 1330,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                }
            ]
        },
        {
            "summary": {
                "no": "2",
                "start": {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                "goal": {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                },
                "move": {
                    "transit_count": 2,
                    "walk_distance": 1440,
                    "fare": {
                        "unit_0": 550.0,
                        "unit_48": 546.0,
                        "unit_128_train": 19610.0,
                        "unit_130_train": 55890.0,
                        "unit_133_train": 102740.0
                    },
                    "type": "move",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T11:04:00+09:00",
                    "time": 64,
                    "distance": 19640,
                    "move_type": [
                        "local_train",
                        "rapid_train",
                        "walk"
                    ]
                }
            },
            "sections": [
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T10:03:00+09:00",
                    "time": 3,
                    "distance": 110,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665231,
                        "lon": 139.712
                    },
                    "name": "表参道",
                    "node_id": "00007820",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "B4口",
                    "numbering": {
                        "departure": [
                            {
                                "symbol": "G",
                                "number": "02"
                            }
                        ]
                    }
                },
                {
                    "next_transit": true,
                    "transport": {
                        "fare": {
                            "unit_0": 170.0,
                            "unit_48": 168.0,
                            "unit_128": 6430.0,
                            "unit_130": 18330.0,
                            "unit_133": 34730.0,
                            "unit_136": 3090.0,
                            "unit_138": 8810.0,
                            "unit_141": 16690.0
                        },
                        "getoff": "1",
                        "color": "#FF9500",
                        "name": "東京メトロ銀座線",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000113",
                            "name": "東京地下鉄（メトロ）"
                        },
                        "links": [
                            {
                                "id": "00000768",
                                "name": "東京メトロ銀座線",
                                "direction": "down",
                                "destination": {
                                    "name": "渋谷",
                                    "id": "00003544"
                                },
                                "from": {
                                    "name": "表参道",
                                    "id": "00007820"
                                },
                                "to": {
                                    "name": "渋谷",
                                    "id": "00003544"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000559",
                        "type": "普通",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 170.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 168.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 6430.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 18330.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 34730.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 3090.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 8810.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 16690.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "local_train",
                    "from_time": "2020-08-19T10:04:00+09:00",
                    "to_time": "2020-08-19T10:07:00+09:00",
                    "time": 3,
                    "distance": 1300,
                    "line_name": "東京メトロ銀座線",
                    "transfer_seconds": 240
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.659035,
                        "lon": 139.702546
                    },
                    "name": "渋谷",
                    "node_id": "00003544",
                    "node_types": [
                        "station"
                    ],
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "G",
                                "number": "01"
                            }
                        ],
                        "departure": [
                            {
                                "symbol": "JY",
                                "number": "20"
                            }
                        ]
                    }
                },
                {
                    "next_transit": true,
                    "transport": {
                        "fare": {
                            "unit_0": 170.0,
                            "unit_48": 168.0,
                            "unit_128": 5270.0,
                            "unit_130": 15010.0,
                            "unit_133": 25290.0,
                            "unit_136": 3650.0,
                            "unit_138": 10400.0,
                            "unit_141": 19690.0,
                            "unit_144": 3280.0,
                            "unit_146": 9360.0,
                            "unit_149": 17720.0,
                            "unit_152": 2550.0,
                            "unit_154": 7280.0,
                            "unit_157": 13780.0
                        },
                        "getoff": "中",
                        "color": "#80C241",
                        "name": "ＪＲ山手線",
                        "fare_season": "busy",
                        "company": {
                            "id": "00000004",
                            "name": "ＪＲ東日本"
                        },
                        "links": [
                            {
                                "id": "00000141",
                                "name": "ＪＲ山手線",
                                "direction": "down",
                                "destination": {
                                    "name": "新宿",
                                    "id": "00004254"
                                },
                                "from": {
                                    "name": "渋谷",
                                    "id": "00003544"
                                },
                                "to": {
                                    "name": "高田馬場",
                                    "id": "00002616"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000330",
                        "type": "普通",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true,
                            "unit_144": true,
                            "unit_146": true,
                            "unit_149": true,
                            "unit_152": true,
                            "unit_154": true,
                            "unit_157": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 170.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 168.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 5270.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 15010.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 25290.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 3650.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 10400.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 19690.0,
                                "id": "141"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 3280.0,
                                "id": "144"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 9360.0,
                                "id": "146"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 17720.0,
                                "id": "149"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 2550.0,
                                "id": "152"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 7280.0,
                                "id": "154"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "fare": 13780.0,
                                "id": "157"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "local_train",
                    "from_time": "2020-08-19T10:13:00+09:00",
                    "to_time": "2020-08-19T10:24:00+09:00",
                    "time": 11,
                    "distance": 6100,
                    "line_name": "ＪＲ山手線",
                    "transfer_seconds": 180
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.712633,
                        "lon": 139.703849
                    },
                    "name": "高田馬場",
                    "node_id": "00002616",
                    "node_types": [
                        "station"
                    ],
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "JY",
                                "number": "15"
                            }
                        ],
                        "departure": [
                            {
                                "symbol": "SS",
                                "number": "02"
                            }
                        ]
                    }
                },
                {
                    "transport": {
                        "fare": {
                            "unit_0": 210.0,
                            "unit_48": 210.0,
                            "unit_128": 7910.0,
                            "unit_130": 22550.0,
                            "unit_133": 42720.0,
                            "unit_136": 2810.0,
                            "unit_138": 8010.0,
                            "unit_141": 15180.0
                        },
                        "getoff": "前・中",
                        "color": "#0099CC",
                        "name": "西武新宿線急行",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000092",
                            "name": "西武鉄道"
                        },
                        "links": [
                            {
                                "id": "00000721",
                                "name": "西武新宿線",
                                "direction": "down",
                                "destination": {
                                    "name": "所沢",
                                    "id": "00003610"
                                },
                                "from": {
                                    "name": "高田馬場",
                                    "id": "00002616"
                                },
                                "to": {
                                    "name": "上石神井",
                                    "id": "00003987"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000487",
                        "type": "快速",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 210.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 210.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 7910.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 22550.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 42720.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 2810.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 8010.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00002616",
                                    "name": "高田馬場"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 15180.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "rapid_train",
                    "from_time": "2020-08-19T10:34:00+09:00",
                    "to_time": "2020-08-19T10:46:00+09:00",
                    "time": 12,
                    "distance": 10800,
                    "line_name": "西武新宿線急行"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.726082,
                        "lon": 139.591758
                    },
                    "name": "上石神井",
                    "node_id": "00003987",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "南口",
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "SS",
                                "number": "13"
                            }
                        ]
                    }
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:46:00+09:00",
                    "to_time": "2020-08-19T11:04:00+09:00",
                    "time": 18,
                    "distance": 1330,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                }
            ]
        },
        {
            "summary": {
                "no": "3",
                "start": {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                "goal": {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                },
                "move": {
                    "transit_count": 1,
                    "walk_distance": 2407,
                    "fare": {
                        "unit_0": 370.0,
                        "unit_48": 367.0,
                        "unit_128_train": 13860.0,
                        "unit_130_train": 39510.0,
                        "unit_133_train": 74860.0
                    },
                    "type": "move",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T11:06:00+09:00",
                    "time": 66,
                    "distance": 16407,
                    "move_type": [
                        "local_train",
                        "rapid_train",
                        "walk"
                    ]
                }
            },
            "sections": [
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T10:03:00+09:00",
                    "time": 3,
                    "distance": 110,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665231,
                        "lon": 139.712
                    },
                    "name": "表参道",
                    "node_id": "00007820",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "B4口",
                    "numbering": {
                        "departure": [
                            {
                                "symbol": "Z",
                                "number": "02"
                            }
                        ]
                    }
                },
                {
                    "next_transit": true,
                    "transport": {
                        "fare": {
                            "unit_0": 170.0,
                            "unit_48": 168.0,
                            "unit_128": 6430.0,
                            "unit_130": 18330.0,
                            "unit_133": 34730.0,
                            "unit_136": 3090.0,
                            "unit_138": 8810.0,
                            "unit_141": 16690.0
                        },
                        "getoff": "3・6",
                        "color": "#8F76D6",
                        "name": "東京メトロ半蔵門線",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000113",
                            "name": "東京地下鉄（メトロ）"
                        },
                        "links": [
                            {
                                "id": "00000774",
                                "name": "東京メトロ半蔵門線",
                                "direction": "down",
                                "destination": {
                                    "name": "渋谷",
                                    "id": "00003544"
                                },
                                "from": {
                                    "name": "表参道",
                                    "id": "00007820"
                                },
                                "to": {
                                    "name": "渋谷",
                                    "id": "00003544"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000451",
                        "type": "普通",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 170.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 168.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 6430.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 18330.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 34730.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 3090.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 8810.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 16690.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "local_train",
                    "from_time": "2020-08-19T10:06:00+09:00",
                    "to_time": "2020-08-19T10:08:00+09:00",
                    "time": 2,
                    "distance": 1300,
                    "line_name": "東京メトロ半蔵門線",
                    "transfer_seconds": 300
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.659463,
                        "lon": 139.701293
                    },
                    "name": "渋谷",
                    "node_id": "00003544",
                    "node_types": [
                        "station"
                    ],
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "Z",
                                "number": "01"
                            }
                        ],
                        "departure": [
                            {
                                "symbol": "IN",
                                "number": "01"
                            }
                        ]
                    }
                },
                {
                    "transport": {
                        "fare": {
                            "unit_0": 200.0,
                            "unit_48": 199.0,
                            "unit_128": 7430.0,
                            "unit_130": 21180.0,
                            "unit_133": 40130.0,
                            "unit_136": 2860.0,
                            "unit_138": 8160.0,
                            "unit_141": 15450.0
                        },
                        "getoff": "前",
                        "color": "#000088",
                        "name": "京王井の頭線急行",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000035",
                            "name": "京王電鉄"
                        },
                        "links": [
                            {
                                "id": "00000273",
                                "name": "京王井の頭線",
                                "direction": "down",
                                "destination": {
                                    "name": "吉祥寺",
                                    "id": "00001556"
                                },
                                "from": {
                                    "name": "渋谷",
                                    "id": "00003544"
                                },
                                "to": {
                                    "name": "吉祥寺",
                                    "id": "00001556"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000484",
                        "type": "快速",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 200.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 199.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 7430.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 21180.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 40130.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 2860.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 8160.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 15450.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "rapid_train",
                    "from_time": "2020-08-19T10:19:00+09:00",
                    "to_time": "2020-08-19T10:36:00+09:00",
                    "time": 17,
                    "distance": 12700,
                    "line_name": "京王井の頭線急行"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.703232,
                        "lon": 139.579642
                    },
                    "name": "吉祥寺",
                    "node_id": "00001556",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "北口",
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "IN",
                                "number": "17"
                            }
                        ]
                    }
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:36:00+09:00",
                    "to_time": "2020-08-19T11:06:00+09:00",
                    "time": 30,
                    "distance": 2297,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                }
            ]
        },
        {
            "summary": {
                "no": "4",
                "start": {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                "goal": {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                },
                "move": {
                    "transit_count": 1,
                    "walk_distance": 2407,
                    "fare": {
                        "unit_0": 370.0,
                        "unit_48": 367.0,
                        "unit_128_train": 13860.0,
                        "unit_130_train": 39510.0,
                        "unit_133_train": 74860.0
                    },
                    "type": "move",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T11:06:00+09:00",
                    "time": 66,
                    "distance": 16407,
                    "move_type": [
                        "local_train",
                        "rapid_train",
                        "walk"
                    ]
                }
            },
            "sections": [
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T10:03:00+09:00",
                    "time": 3,
                    "distance": 110,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665231,
                        "lon": 139.712
                    },
                    "name": "表参道",
                    "node_id": "00007820",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "B4口",
                    "numbering": {
                        "departure": [
                            {
                                "symbol": "G",
                                "number": "02"
                            }
                        ]
                    }
                },
                {
                    "next_transit": true,
                    "transport": {
                        "fare": {
                            "unit_0": 170.0,
                            "unit_48": 168.0,
                            "unit_128": 6430.0,
                            "unit_130": 18330.0,
                            "unit_133": 34730.0,
                            "unit_136": 3090.0,
                            "unit_138": 8810.0,
                            "unit_141": 16690.0
                        },
                        "getoff": "1",
                        "color": "#FF9500",
                        "name": "東京メトロ銀座線",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000113",
                            "name": "東京地下鉄（メトロ）"
                        },
                        "links": [
                            {
                                "id": "00000768",
                                "name": "東京メトロ銀座線",
                                "direction": "down",
                                "destination": {
                                    "name": "渋谷",
                                    "id": "00003544"
                                },
                                "from": {
                                    "name": "表参道",
                                    "id": "00007820"
                                },
                                "to": {
                                    "name": "渋谷",
                                    "id": "00003544"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000559",
                        "type": "普通",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 170.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 168.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 6430.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 18330.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 34730.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 3090.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 8810.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "fare": 16690.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "local_train",
                    "from_time": "2020-08-19T10:04:00+09:00",
                    "to_time": "2020-08-19T10:07:00+09:00",
                    "time": 3,
                    "distance": 1300,
                    "line_name": "東京メトロ銀座線",
                    "transfer_seconds": 360
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.659035,
                        "lon": 139.702546
                    },
                    "name": "渋谷",
                    "node_id": "00003544",
                    "node_types": [
                        "station"
                    ],
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "G",
                                "number": "01"
                            }
                        ],
                        "departure": [
                            {
                                "symbol": "IN",
                                "number": "01"
                            }
                        ]
                    }
                },
                {
                    "transport": {
                        "fare": {
                            "unit_0": 200.0,
                            "unit_48": 199.0,
                            "unit_128": 7430.0,
                            "unit_130": 21180.0,
                            "unit_133": 40130.0,
                            "unit_136": 2860.0,
                            "unit_138": 8160.0,
                            "unit_141": 15450.0
                        },
                        "getoff": "前",
                        "color": "#000088",
                        "name": "京王井の頭線急行",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000035",
                            "name": "京王電鉄"
                        },
                        "links": [
                            {
                                "id": "00000273",
                                "name": "京王井の頭線",
                                "direction": "down",
                                "destination": {
                                    "name": "吉祥寺",
                                    "id": "00001556"
                                },
                                "from": {
                                    "name": "渋谷",
                                    "id": "00003544"
                                },
                                "to": {
                                    "name": "吉祥寺",
                                    "id": "00001556"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000484",
                        "type": "快速",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 200.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 199.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 7430.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 21180.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 40130.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 2860.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 8160.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00003544",
                                    "name": "渋谷"
                                },
                                "goal": {
                                    "node_id": "00001556",
                                    "name": "吉祥寺"
                                },
                                "fare": 15450.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "rapid_train",
                    "from_time": "2020-08-19T10:19:00+09:00",
                    "to_time": "2020-08-19T10:36:00+09:00",
                    "time": 17,
                    "distance": 12700,
                    "line_name": "京王井の頭線急行"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.703232,
                        "lon": 139.579642
                    },
                    "name": "吉祥寺",
                    "node_id": "00001556",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "北口",
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "IN",
                                "number": "17"
                            }
                        ]
                    }
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:36:00+09:00",
                    "to_time": "2020-08-19T11:06:00+09:00",
                    "time": 30,
                    "distance": 2297,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                }
            ]
        },
        {
            "summary": {
                "no": "5",
                "start": {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                "goal": {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                },
                "move": {
                    "transit_count": 2,
                    "walk_distance": 1940,
                    "fare": {
                        "unit_0": 420.0,
                        "unit_48": 410.0,
                        "unit_128_train": 16390.0,
                        "unit_130_train": 46720.0,
                        "unit_133_train": 88510.0
                    },
                    "type": "move",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T11:08:00+09:00",
                    "time": 68,
                    "distance": 21640,
                    "move_type": [
                        "local_train",
                        "rapid_train",
                        "walk"
                    ]
                }
            },
            "sections": [
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665251,
                        "lon": 139.712092
                    },
                    "name": "start"
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:00:00+09:00",
                    "to_time": "2020-08-19T10:03:00+09:00",
                    "time": 3,
                    "distance": 110,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.665231,
                        "lon": 139.712
                    },
                    "name": "表参道",
                    "node_id": "00007820",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "B4口",
                    "numbering": {
                        "departure": [
                            {
                                "symbol": "G",
                                "number": "02"
                            }
                        ]
                    }
                },
                {
                    "next_transit": true,
                    "transport": {
                        "fare": {
                            "unit_48": 0.0
                        },
                        "getoff": "2・3・6",
                        "color": "#FF9500",
                        "name": "東京メトロ銀座線",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000113",
                            "name": "東京地下鉄（メトロ）"
                        },
                        "links": [
                            {
                                "id": "00000768",
                                "name": "東京メトロ銀座線",
                                "direction": "up",
                                "destination": {
                                    "name": "銀座",
                                    "id": "00001908"
                                },
                                "from": {
                                    "name": "表参道",
                                    "id": "00007820"
                                },
                                "to": {
                                    "name": "赤坂見附",
                                    "id": "00005079"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000559",
                        "type": "普通",
                        "fare_break": {
                            "unit_0": false,
                            "unit_48": false,
                            "unit_128": false,
                            "unit_130": false,
                            "unit_133": false,
                            "unit_136": false,
                            "unit_138": false,
                            "unit_141": false
                        }
                    },
                    "type": "move",
                    "move": "local_train",
                    "from_time": "2020-08-19T10:04:00+09:00",
                    "to_time": "2020-08-19T10:09:00+09:00",
                    "time": 5,
                    "distance": 2700,
                    "line_name": "東京メトロ銀座線",
                    "transfer_seconds": 60
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.676905,
                        "lon": 139.737296
                    },
                    "name": "赤坂見附",
                    "node_id": "00005079",
                    "node_types": [
                        "station"
                    ],
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "G",
                                "number": "05"
                            }
                        ],
                        "departure": [
                            {
                                "symbol": "M",
                                "number": "13"
                            }
                        ]
                    }
                },
                {
                    "next_transit": true,
                    "transport": {
                        "fare": {
                            "unit_0": 170.0,
                            "unit_48": 168.0,
                            "unit_128": 7290.0,
                            "unit_130": 20780.0,
                            "unit_133": 39370.0,
                            "unit_136": 4030.0,
                            "unit_138": 11490.0,
                            "unit_141": 21770.0
                        },
                        "getoff": "6",
                        "color": "#F62E36",
                        "name": "東京メトロ丸ノ内線",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000113",
                            "name": "東京地下鉄（メトロ）"
                        },
                        "links": [
                            {
                                "id": "00000766",
                                "name": "東京メトロ丸ノ内線",
                                "direction": "down",
                                "destination": {
                                    "name": "新宿",
                                    "id": "00004254"
                                },
                                "from": {
                                    "name": "赤坂見附",
                                    "id": "00005079"
                                },
                                "to": {
                                    "name": "新宿",
                                    "id": "00004254"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000560",
                        "type": "普通",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00004254",
                                    "name": "新宿"
                                },
                                "fare": 170.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00004254",
                                    "name": "新宿"
                                },
                                "fare": 168.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00004254",
                                    "name": "新宿"
                                },
                                "fare": 7290.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00004254",
                                    "name": "新宿"
                                },
                                "fare": 20780.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00004254",
                                    "name": "新宿"
                                },
                                "fare": 39370.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00004254",
                                    "name": "新宿"
                                },
                                "fare": 4030.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00004254",
                                    "name": "新宿"
                                },
                                "fare": 11490.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00007820",
                                    "name": "表参道"
                                },
                                "goal": {
                                    "node_id": "00004254",
                                    "name": "新宿"
                                },
                                "fare": 21770.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "local_train",
                    "from_time": "2020-08-19T10:12:00+09:00",
                    "to_time": "2020-08-19T10:22:00+09:00",
                    "time": 10,
                    "distance": 4200,
                    "line_name": "東京メトロ丸ノ内線"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.692487,
                        "lon": 139.701063
                    },
                    "name": "新宿",
                    "node_id": "00004254",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "B13口",
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "M",
                                "number": "08"
                            }
                        ]
                    }
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:22:00+09:00",
                    "to_time": "2020-08-19T10:27:00+09:00",
                    "time": 5,
                    "distance": 500,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.695127,
                        "lon": 139.700114
                    },
                    "name": "西武新宿",
                    "node_id": "00004927",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "正面口",
                    "numbering": {
                        "departure": [
                            {
                                "symbol": "SS",
                                "number": "01"
                            }
                        ]
                    }
                },
                {
                    "transport": {
                        "fare": {
                            "unit_0": 250.0,
                            "unit_48": 242.0,
                            "unit_128": 9100.0,
                            "unit_130": 25940.0,
                            "unit_133": 49140.0,
                            "unit_136": 3020.0,
                            "unit_138": 8610.0,
                            "unit_141": 16310.0
                        },
                        "getoff": "前・中",
                        "color": "#0099CC",
                        "name": "西武新宿線急行",
                        "fare_season": "normal",
                        "company": {
                            "id": "00000092",
                            "name": "西武鉄道"
                        },
                        "links": [
                            {
                                "id": "00000721",
                                "name": "西武新宿線",
                                "direction": "down",
                                "destination": {
                                    "name": "所沢",
                                    "id": "00003610"
                                },
                                "from": {
                                    "name": "西武新宿",
                                    "id": "00004927"
                                },
                                "to": {
                                    "name": "上石神井",
                                    "id": "00003987"
                                },
                                "is_timetable": "false"
                            }
                        ],
                        "id": "00000487",
                        "type": "快速",
                        "fare_break": {
                            "unit_0": true,
                            "unit_48": true,
                            "unit_128": true,
                            "unit_130": true,
                            "unit_133": true,
                            "unit_136": true,
                            "unit_138": true,
                            "unit_141": true
                        },
                        "fare_detail": [
                            {
                                "start": {
                                    "node_id": "00004927",
                                    "name": "西武新宿"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 250.0,
                                "id": "0"
                            },
                            {
                                "start": {
                                    "node_id": "00004927",
                                    "name": "西武新宿"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 242.0,
                                "id": "48"
                            },
                            {
                                "start": {
                                    "node_id": "00004927",
                                    "name": "西武新宿"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 9100.0,
                                "id": "128"
                            },
                            {
                                "start": {
                                    "node_id": "00004927",
                                    "name": "西武新宿"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 25940.0,
                                "id": "130"
                            },
                            {
                                "start": {
                                    "node_id": "00004927",
                                    "name": "西武新宿"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 49140.0,
                                "id": "133"
                            },
                            {
                                "start": {
                                    "node_id": "00004927",
                                    "name": "西武新宿"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 3020.0,
                                "id": "136"
                            },
                            {
                                "start": {
                                    "node_id": "00004927",
                                    "name": "西武新宿"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 8610.0,
                                "id": "138"
                            },
                            {
                                "start": {
                                    "node_id": "00004927",
                                    "name": "西武新宿"
                                },
                                "goal": {
                                    "node_id": "00003987",
                                    "name": "上石神井"
                                },
                                "fare": 16310.0,
                                "id": "141"
                            }
                        ]
                    },
                    "type": "move",
                    "move": "rapid_train",
                    "from_time": "2020-08-19T10:34:00+09:00",
                    "to_time": "2020-08-19T10:50:00+09:00",
                    "time": 16,
                    "distance": 12800,
                    "line_name": "西武新宿線急行"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.726082,
                        "lon": 139.591758
                    },
                    "name": "上石神井",
                    "node_id": "00003987",
                    "node_types": [
                        "station"
                    ],
                    "gateway": "南口",
                    "numbering": {
                        "arrival": [
                            {
                                "symbol": "SS",
                                "number": "13"
                            }
                        ]
                    }
                },
                {
                    "type": "move",
                    "move": "walk",
                    "from_time": "2020-08-19T10:50:00+09:00",
                    "to_time": "2020-08-19T11:08:00+09:00",
                    "time": 18,
                    "distance": 1330,
                    "line_name": "徒歩"
                },
                {
                    "type": "point",
                    "coord": {
                        "lat": 35.718571,
                        "lon": 139.587021
                    },
                    "name": "goal"
                }
            ]
        }
    ],
    "unit": {
        "datum": "wgs84",
        "coord_unit": "degree",
        "distance": "metre",
        "time": "minute",
        "currency": "JPY"
    }
}

*/

// To parse this JSON data, do
//
//     final routeTransit = routeTransitFromJson(jsonString);

import 'dart:convert';

import 'package:museum_search/extensions/extensions.dart';

RouteTransit routeTransitFromJson(String str) =>
    RouteTransit.fromJson(json.decode(str) as Map<String, dynamic>);

String routeTransitToJson(RouteTransit data) => json.encode(data.toJson());

///
class RouteTransit {
  RouteTransit({
    required this.items,
    required this.unit,
  });

  factory RouteTransit.fromJson(Map<String, dynamic> json) => RouteTransit(
        items: List<Item>.from(
            json['items'].map((x) => Item.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
        unit: Unit.fromJson(json['unit'] as Map<String, dynamic>),
      );

  List<Item> items;
  Unit unit;

  Map<String, dynamic> toJson() => {
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
        'unit': unit.toJson(),
      };
}

///
class Item {
  Item({
    required this.summary,
    required this.sections,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
        sections: List<Section>.from(json['sections']
                .map((x) => Section.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>),
      );

  Summary summary;
  List<Section> sections;

  Map<String, dynamic> toJson() => {
        'summary': summary.toJson(),
        'sections': List<dynamic>.from(sections.map((x) => x.toJson())),
      };
}

///
class Section {
  Section({
    required this.type,
    this.coord,
    this.name,
    this.move,
    this.fromTime,
    this.toTime,
    this.time,
    this.distance,
    this.lineName,
    this.nodeId,
    this.nodeTypes,
    this.gateway,
    this.numbering,
    this.nextTransit,
    this.transport,
    this.transferSeconds,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        type: json['type'].toString(),
        coord: json['coord'] == null
            ? null
            : Coord.fromJson(json['coord'] as Map<String, dynamic>),
        name: json['name'].toString(),
        move: json['move'].toString(),
        fromTime: json['from_time'] == null
            ? null
            : DateTime.parse(json['from_time'].toString()),
        toTime: json['to_time'] == null
            ? null
            : DateTime.parse(json['to_time'].toString()),
        time: json['time'].toString().toInt(),
        distance: json['distance'].toString().toInt(),
        lineName: json['line_name'].toString(),
        nodeId: json['node_id'].toString(),
        nodeTypes: json['node_types'] == null
            ? []
            : List<String>.from(
                json['node_types']!.map((x) => x) as Iterable<dynamic>),
        gateway: json['gateway'].toString(),
        numbering: json['numbering'] == null
            ? null
            : Numbering.fromJson(json['numbering'] as Map<String, dynamic>),
        nextTransit: json['next_transit'] as bool,
        transport: json['transport'] == null
            ? null
            : Transport.fromJson(json['transport'] as Map<String, dynamic>),
        transferSeconds: json['transfer_seconds'].toString().toInt(),
      );

  String type;
  Coord? coord;
  String? name;
  String? move;
  DateTime? fromTime;
  DateTime? toTime;
  int? time;
  int? distance;
  String? lineName;
  String? nodeId;
  List<String>? nodeTypes;
  String? gateway;
  Numbering? numbering;
  bool? nextTransit;
  Transport? transport;
  int? transferSeconds;

  Map<String, dynamic> toJson() => {
        'type': type,
        'coord': coord?.toJson(),
        'name': name,
        'move': move,
        'from_time': fromTime?.toIso8601String(),
        'to_time': toTime?.toIso8601String(),
        'time': time,
        'distance': distance,
        'line_name': lineName,
        'node_id': nodeId,
        'node_types': nodeTypes == null
            ? []
            : List<dynamic>.from(nodeTypes!.map((x) => x)),
        'gateway': gateway,
        'numbering': numbering?.toJson(),
        'next_transit': nextTransit,
        'transport': transport?.toJson(),
        'transfer_seconds': transferSeconds,
      };
}

///
class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json['lat'].toString().toDouble(),
        lon: json['lon'].toString().toDouble(),
      );

  double lat;
  double lon;

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lon': lon,
      };
}

///
class Numbering {
  Numbering({
    this.departure,
    this.arrival,
  });

  factory Numbering.fromJson(Map<String, dynamic> json) => Numbering(
        departure: json['departure'] == null
            ? []
            : List<Arrival>.from(json['departure']!
                    .map((x) => Arrival.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
        arrival: json['arrival'] == null
            ? []
            : List<Arrival>.from(json['arrival']!
                    .map((x) => Arrival.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
      );

  List<Arrival>? departure;
  List<Arrival>? arrival;

  Map<String, dynamic> toJson() => {
        'departure': departure == null
            ? []
            : List<dynamic>.from(departure!.map((x) => x.toJson())),
        'arrival': arrival == null
            ? []
            : List<dynamic>.from(arrival!.map((x) => x.toJson())),
      };
}

///
class Arrival {
  Arrival({
    required this.symbol,
    required this.number,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        symbol: json['symbol'].toString(),
        number: json['number'].toString(),
      );

  String symbol;
  String number;

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'number': number,
      };
}

///
class Transport {
  Transport({
    required this.fare,
    required this.getoff,
    required this.color,
    required this.name,
    required this.fareSeason,
    required this.company,
    required this.links,
    required this.id,
    required this.type,
    required this.fareBreak,
    this.fareDetail,
  });

  factory Transport.fromJson(Map<String, dynamic> json) => Transport(
        fare: Map.from(json['fare'] as Map<dynamic, dynamic>).map((k, v) =>
            MapEntry<String, int>(k.toString(), v.toString().toInt())),
        getoff: json['getoff'].toString(),
        color: json['color'].toString(),
        name: json['name'].toString(),
        fareSeason: json['fare_season'].toString(),
        company: Company.fromJson(json['company'] as Map<String, dynamic>),
        links: List<Link>.from(
            json['links'].map((x) => Link.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
        id: json['id'].toString(),
        type: json['type'].toString(),
        fareBreak: Map.from(json['fare_break'] as Map<dynamic, dynamic>)
            .map((k, v) => MapEntry<String, bool>(k.toString(), v as bool)),
        fareDetail: json['fare_detail'] == null
            ? []
            : List<FareDetail>.from(json['fare_detail']!
                    .map((x) => FareDetail.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
      );

  Map<String, int> fare;
  String getoff;
  String color;
  String name;
  String fareSeason;
  Company company;
  List<Link> links;
  String id;
  String type;
  Map<String, bool> fareBreak;
  List<FareDetail>? fareDetail;

  Map<String, dynamic> toJson() => {
        'fare': Map.from(fare)
            .map((k, v) => MapEntry<String, dynamic>(k.toString(), v)),
        'getoff': getoff,
        'color': color,
        'name': name,
        'fare_season': fareSeason,
        'company': company.toJson(),
        'links': List<dynamic>.from(links.map((x) => x.toJson())),
        'id': id,
        'type': type,
        'fare_break': Map.from(fareBreak)
            .map((k, v) => MapEntry<String, dynamic>(k.toString(), v)),
        'fare_detail': fareDetail == null
            ? []
            : List<dynamic>.from(fareDetail!.map((x) => x.toJson())),
      };
}

///
class Company {
  Company({
    required this.id,
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['id'].toString(),
        name: json['name'].toString(),
      );

  String id;
  String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

///
class FareDetail {
  FareDetail({
    required this.start,
    required this.goal,
    required this.fare,
    required this.id,
  });

  factory FareDetail.fromJson(Map<String, dynamic> json) => FareDetail(
        start: FareDetailGoal.fromJson(json['start'] as Map<String, dynamic>),
        goal: FareDetailGoal.fromJson(json['goal'] as Map<String, dynamic>),
        fare: json['fare'].toString().toInt(),
        id: json['id'].toString(),
      );

  FareDetailGoal start;
  FareDetailGoal goal;
  int fare;
  String id;

  Map<String, dynamic> toJson() => {
        'start': start.toJson(),
        'goal': goal.toJson(),
        'fare': fare,
        'id': id,
      };
}

///
class FareDetailGoal {
  FareDetailGoal({
    required this.nodeId,
    required this.name,
  });

  factory FareDetailGoal.fromJson(Map<String, dynamic> json) => FareDetailGoal(
        nodeId: json['node_id'].toString(),
        name: json['name'].toString(),
      );

  String nodeId;
  String name;

  Map<String, dynamic> toJson() => {
        'node_id': nodeId,
        'name': name,
      };
}

///
class Link {
  Link({
    required this.id,
    required this.name,
    required this.direction,
    required this.destination,
    required this.from,
    required this.to,
    required this.isTimetable,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        id: json['id'].toString(),
        name: json['name'].toString(),
        direction: json['direction'].toString(),
        destination:
            Company.fromJson(json['destination'] as Map<String, dynamic>),
        from: Company.fromJson(json['from'] as Map<String, dynamic>),
        to: Company.fromJson(json['to'] as Map<String, dynamic>),
        isTimetable: json['is_timetable'].toString(),
      );

  String id;
  String name;
  String direction;
  Company destination;
  Company from;
  Company to;
  String isTimetable;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'direction': direction,
        'destination': destination.toJson(),
        'from': from.toJson(),
        'to': to.toJson(),
        'is_timetable': isTimetable,
      };
}

///
class Summary {
  Summary({
    required this.no,
    required this.start,
    required this.goal,
    required this.move,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        no: json['no'].toString(),
        start: SummaryGoal.fromJson(json['start'] as Map<String, dynamic>),
        goal: SummaryGoal.fromJson(json['goal'] as Map<String, dynamic>),
        move: MoveClass.fromJson(json['move'] as Map<String, dynamic>),
      );

  String no;
  SummaryGoal start;
  SummaryGoal goal;
  MoveClass move;

  Map<String, dynamic> toJson() => {
        'no': no,
        'start': start.toJson(),
        'goal': goal.toJson(),
        'move': move.toJson(),
      };
}

///
class SummaryGoal {
  SummaryGoal({
    required this.type,
    required this.coord,
    required this.name,
  });

  factory SummaryGoal.fromJson(Map<String, dynamic> json) => SummaryGoal(
        type: json['type'].toString(),
        coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
        name: json['name'].toString(),
      );

  String type;
  Coord coord;
  String name;

  Map<String, dynamic> toJson() => {
        'type': type,
        'coord': coord.toJson(),
        'name': name,
      };
}

///
class MoveClass {
  MoveClass({
    required this.transitCount,
    required this.walkDistance,
    required this.fare,
    required this.type,
    required this.fromTime,
    required this.toTime,
    required this.time,
    required this.distance,
    required this.moveType,
  });

  factory MoveClass.fromJson(Map<String, dynamic> json) => MoveClass(
        transitCount: json['transit_count'].toString().toInt(),
        walkDistance: json['walk_distance'].toString().toInt(),
        fare: Fare.fromJson(json['fare'] as Map<String, dynamic>),
        type: json['type'].toString(),
        fromTime: DateTime.parse(json['from_time'].toString()),
        toTime: DateTime.parse(json['to_time'].toString()),
        time: json['time'].toString().toInt(),
        distance: json['distance'].toString().toInt(),
        moveType: List<String>.from(
            json['move_type'].map((x) => x) as Iterable<dynamic>),
      );

  int transitCount;
  int walkDistance;
  Fare fare;
  String type;
  DateTime fromTime;
  DateTime toTime;
  int time;
  int distance;
  List<String> moveType;

  Map<String, dynamic> toJson() => {
        'transit_count': transitCount,
        'walk_distance': walkDistance,
        'fare': fare.toJson(),
        'type': type,
        'from_time': fromTime.toIso8601String(),
        'to_time': toTime.toIso8601String(),
        'time': time,
        'distance': distance,
        'move_type': List<dynamic>.from(moveType.map((x) => x)),
      };
}

///
class Fare {
  Fare({
    required this.unit0,
    required this.unit48,
    required this.unit128Train,
    required this.unit130Train,
    required this.unit133Train,
  });

  factory Fare.fromJson(Map<String, dynamic> json) => Fare(
        unit0: json['unit_0'].toString().toInt(),
        unit48: json['unit_48'].toString().toInt(),
        unit128Train: json['unit_128_train'].toString().toInt(),
        unit130Train: json['unit_130_train'].toString().toInt(),
        unit133Train: json['unit_133_train'].toString().toInt(),
      );

  int unit0;
  int unit48;
  int unit128Train;
  int unit130Train;
  int unit133Train;

  Map<String, dynamic> toJson() => {
        'unit_0': unit0,
        'unit_48': unit48,
        'unit_128_train': unit128Train,
        'unit_130_train': unit130Train,
        'unit_133_train': unit133Train,
      };
}

///
class Unit {
  Unit({
    required this.datum,
    required this.coordUnit,
    required this.distance,
    required this.time,
    required this.currency,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        datum: json['datum'].toString(),
        coordUnit: json['coord_unit'].toString(),
        distance: json['distance'].toString(),
        time: json['time'].toString(),
        currency: json['currency'].toString(),
      );

  String datum;
  String coordUnit;
  String distance;
  String time;
  String currency;

  Map<String, dynamic> toJson() => {
        'datum': datum,
        'coord_unit': coordUnit,
        'distance': distance,
        'time': time,
        'currency': currency,
      };
}
