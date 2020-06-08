package rvboard;

import java.sql.Timestamp;

public class rvboardDTO {
	private int ref;
	private String name;
	private String content;
	private Timestamp reg;
	private String id;
	private int fk_num;
	
	
	public int getFk_num() {
		return fk_num;
	}
	public void setFk_num(int fk_num) {
		this.fk_num = fk_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	
	
	
}
