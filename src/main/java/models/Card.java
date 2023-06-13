package models;

public class Card {

    String cardHolder;
    String expireDate;
    String cardNumber;
    String client;

    public Card(String cardHolder, String expireDate, String cardNumber, String client) {
        this.cardHolder = cardHolder;
        this.expireDate = expireDate;
        this.cardNumber = cardNumber;
        this.client = client;
    }

    public String getCardHolder() {
        return cardHolder;
    }

    public void setCardHolder(String cardHolder) {
        this.cardHolder = cardHolder;
    }

    public void setExpireDate(String expireDate) {
        this.expireDate = expireDate;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getExpireDate() {
        return expireDate;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getClient() {
        return client;
    }

}
