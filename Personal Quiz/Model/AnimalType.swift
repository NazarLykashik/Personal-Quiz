//
//  AnimalType.swift
//  Personal Quiz
//
//  Created by Nazar Lykashik on 16.06.22.
//

enum AnimalType: String{
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String{
        switch self{
        case.dog:
            return "Вам нравиться быть с друзьями, вы окружаете себя людьми которые вам нравятся и всегда готовы помочь!"
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case.rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энегии."
        case.turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчевый выигрывает на дальних дситанциях."
        }
    }
}
