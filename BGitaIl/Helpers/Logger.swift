//
//  Logger.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Foundation
import SwiftyBeaver

protocol LoggerType {
    func verbose(_ message: String, _ file: String, function: String, line: Int)
    func debug(_ message: String, _ file: String, function: String, line: Int)
    func info(_ message: String, _ file: String, function: String, line: Int)
    func warning(_ message: String, _ file: String, function: String, line: Int)
    func error(_ message: String, _ file: String, function: String, line: Int)
}

extension LoggerType {
    func verbose(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        verbose(message, file, function: function, line: line)
    }

    func debug(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        debug(message, file, function: function, line: line)
    }

    func info(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        info(message, file, function: function, line: line)
    }

    func warning(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        warning(message, file, function: function, line: line)
    }

    func error(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        error(message, file, function: function, line: line)
    }
}

class Logger: LoggerType {
    private let log: SwiftyBeaver.Type = {
        let log = SwiftyBeaver.self
        let console = ConsoleDestination()
        log.addDestination(console)
        return log
    }()

    func verbose(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log.verbose(message, file: file, function: function, line: line)
    }

    func debug(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log.debug(message, file: file, function: function, line: line)
    }

    func info(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log.info(message, file: file, function: function, line: line)
    }

    func warning(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log.warning(message, file: file, function: function, line: line)
    }

    func error(_ message: String, _ file: String = #file, function: String = #function, line: Int = #line) {
        log.error(message, file: file, function: function, line: line)
    }
}
