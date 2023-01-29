#include "serialport.h"
#include <QDebug>

SerialPort::SerialPort(QObject *parent)
    : QObject{parent}
    , m_serial(new QSerialPort(this))
    , m_isMsgRcv(false)
{
    m_serialPortSettings.name = "/dev/ttyUSB3";
    m_serialPortSettings.baudRate = QSerialPort::Baud115200;
    m_serialPortSettings.dataBits = QSerialPort::Data8;
    m_serialPortSettings.parity = QSerialPort::NoParity;
    m_serialPortSettings.stopBits = QSerialPort::OneStop;
    m_serialPortSettings.flowControl = QSerialPort::NoFlowControl;
}

void SerialPort::openSerialPort()
{
    qDebug() << "Open";
    m_serial->setPortName(m_serialPortSettings.name);
    m_serial->setBaudRate(m_serialPortSettings.baudRate);
    m_serial->setDataBits(m_serialPortSettings.dataBits);
    m_serial->setParity(m_serialPortSettings.parity);
    m_serial->setStopBits(m_serialPortSettings.stopBits);
    m_serial->setFlowControl(m_serialPortSettings.flowControl);
    m_serial->open(QIODevice::ReadWrite);
    if(!m_serial->isOpen())
        qDebug() << "Brak urzadzenia ";
    else
    {
        connect(m_serial, &QSerialPort::readyRead, this, &SerialPort::getMsg);
    }
}

void SerialPort::closeSerialPort()
{
    qDebug() << "Close";
    if(m_serial->isOpen())
       m_serial->close();
    disconnect(m_serial, &QSerialPort::readyRead, this, &SerialPort::getMsg);
    emit isMsgRcvChanged("Closed");
}

void SerialPort::setBaudRate(int baudValue)
{
    m_serialPortSettings.baudRate = baudValue;
}

void SerialPort::getMsg()
{
    bool ok = true;
    QByteArray data;
    data = m_serial->readAll().toHex().toUpper();
    if(data.toInt(&ok, 16) < 255)
        emit isMsgRcvChanged(QString::number(data.toInt(&ok, 16)));


//    QByteArray data;
//    QByteArray datafirst;  //cały komunikat układu stabilizacji

//    datafirst.append(m_serial->readAll()); //wczytanie do bufora komunikatu z portu szeregowego

//    while((datafirst.contains(">")/*||rxBuffer.contains(">V")*/) && datafirst.contains("\r\n"))
//    {
//        datafirst = datafirst.right(datafirst.length() - datafirst.indexOf(">"));

//        data = datafirst.left(datafirst.indexOf("\n") + 1);

//        emit isMsgRcvChanged(data);

//        datafirst = datafirst.right(datafirst.length() - datafirst.indexOf("\n") - 1);
//    }
}
