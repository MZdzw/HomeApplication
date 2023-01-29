#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <QObject>
#include <QSerialPort>

struct Settings
{
    QString name;
    qint32 baudRate;
    QString stringBaudRate;
    QSerialPort::DataBits dataBits;
    QString stringDataBits;
    QSerialPort::Parity parity;
    QString stringParity;
    QSerialPort::StopBits stopBits;
    QString stringStopBits;
    QSerialPort::FlowControl flowControl;
    QString stringFlowControl;
};

class SerialPort : public QObject
{
    Q_OBJECT
public:
    explicit SerialPort(QObject *parent = nullptr);
    Q_PROPERTY(bool isMsgRcv READ getisMsgRcv NOTIFY isMsgRcvChanged);

signals:
    void isMsgReceived();

    void isMsgRcvChanged(QString data1);

public slots:
    void openSerialPort();
    void closeSerialPort();
    void setBaudRate(int baudValue);
    bool getisMsgRcv() const
    {
        return m_isMsgRcv;
    }

private:
    void getMsg();

    QSerialPort* m_serial;
    Settings m_serialPortSettings;
    bool m_isMsgRcv;
};

#endif // SERIALPORT_H
