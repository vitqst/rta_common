package vn.rta.common.bean;

public class CryptoBean {
	private String keyseed = "";
	private String rawKey = "";
	private String cryptogram = "";
	private String plaintext = "";
	
	public String getCryptogram() {
		return cryptogram.trim();
	}
	public void setCryptogram(String cryptogram) {
		this.cryptogram = cryptogram.trim();
	}
	public String getPlaintext() {
		return plaintext.trim();
	}
	public void setPlaintext(String plaintext) {
		this.plaintext = plaintext.trim();
	}
	public String getKeyseed() {
		return keyseed;
	}
	public void setKeyseed(String keyseed) {
		this.keyseed = keyseed;
	}
	public String getRawKey() {
		return rawKey;
	}
	public void setRawKey(String rawKey) {
		this.rawKey = rawKey;
	}
}
