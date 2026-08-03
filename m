Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A340B0FB
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761206; cv=none; b=FfeyjqyXHYaH4jdbqUUNLaBu1MyFByTvkVzHx5bmzawlT3FVDtdEC5rgYJq72bzwgKyYd4lHM7dZuQ04/GIRckzUhFegAVejgN3k+29BrXqc9c6shBsA9HRDCGjSh12i8sz8M9dOua96lPqrGj9OxDGpLtZG4yCv+FqXcjZl49k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761206; c=relaxed/simple;
	bh=rh1eLSVVlNLNo/CfcBH9x58GeH1IP8v1OBx+qCItK94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVUIiooOSPi43KX7FKmcs2be64xQdU2aNb/yNrqWlsqsN/J0L9p5Uwm0/3mml8VI+aQzH221TmoclDZ5WHN2Hy9guGLOONEVp4yJBjaV7+GVFV9I0nGzYZYu+nfjSF9EejR0hNdfGsR9v2bYE7lds2jwMqYU0PET4gWy8PNsqrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQtZJW7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCMOZY/Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQtZJW7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCMOZY/Y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4nKe856166
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 12:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rh1eLSVVlNLNo/CfcBH9x58GeH1IP8v1OBx+qCItK94=; b=bQtZJW7xURfw1K8P
	JbrKy4C7zNGt1oX0z9cL1YPZyNfKYOyvQ1Pt6zPn5e5nqoqMHPrzG6hgmDp+6x1L
	lswiM2dP5b9ZPLaW3lh0SNMKZqa+meLz+PBIBuxm9WrZiFPRfjadaJArQLDWszq+
	B09qqt68o2bupcFzO7iDHlj/YdhkUqk8lLzT65cZl//Jwz3NnNHjjijPojl050HD
	86SOyeE0v7OoKJMzHNs89R6z0C5qYmmd+Gzo74w1oAiUAoKnql8/RnY5+nAt7xcj
	aBZm2txyrKJP3uznCisBzRH1AemgWaqBkKvJ1lEkSG8ktBoASGCunmYba5IhAbUR
	i80e8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb9j0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 12:46:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so28189775ad.1
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785761203; x=1786366003; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rh1eLSVVlNLNo/CfcBH9x58GeH1IP8v1OBx+qCItK94=;
        b=eCMOZY/YtTGYyg+xBo0YjuNOxvsJxTAqV30fHMbusCsnQoLxvVO+ZjENEPQ66PE0j/
         6Q/D2Ta4Dhe4R5tGVdVdQM6w1itWez7OHs87tVC63sT+MN2JVbBdyzltWcsl1iudqaNR
         9F5248XnYRAx1+4m21L93rfOJEwbjVr0z78Zl9znplPSJr/Xfq2xuxKR0TMNcY7kOPE2
         TNqK673jf6ysKKvMa+nf1BoctLuauRD1fKyiGzicgk4n2H5h5reEuGpBQx5ZmHXpxXZK
         TuSiKl6l+t70RE3gQG/LJeb/uKQtffNozznoq2AiGjlohP0yV7hAZqahhrvRACIJCUgm
         Bakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761203; x=1786366003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rh1eLSVVlNLNo/CfcBH9x58GeH1IP8v1OBx+qCItK94=;
        b=gbLN4Ydze1cVvL7RGLLN5AJ+VxRaqbULYSqrznPhKrnM2pdqhTDxfXIFoCel25uAgk
         2NUb5quh1c09v0qV2cB30LoEAfsxM4pwR4EpTmNJbQ31D6NzGP1ef29p2v62/oV0cJhN
         XqXXaFZbOSv4y0EyeKXr7clYAFvuZfg7wZjNidNz5ZuKLx5oz/N3GJ5gbIwdjaXUS8fD
         /avYPyUB3obOcTKXhgTBQKoVJ0epr4i2vGuoffONT9aBYv0BFYlAeDYPt3SDjut+/acu
         K+jxKnyluN9ciKpOnF5P/diQniTCthPoaYLUQo653Gj/wqQiVk4lYTF+BZb8tIbNlrec
         XhRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwJDP+bHpUyPHizHJlCGg22sHzF2CeyqWoPsxdzxpq92r6k1s/LKPkKkeuRYfTKne3/aw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKaOP4Cf9NOb6s6k18vZC23pJWISS2IGF5ylVZwVoTXKeEuXD5
	bwOsqRq/F6AeUYpPCrmytXKagCGcb0BckFCEnL8/7/E9XCYaDroKwtahlyfQ7mipBqDk9zBJHIW
	Al3PMMjPYNFl1i97UH2NDEWW4HtnT8lHFwjEI2krJIy1EHsTV4CZ81ZY=
X-Gm-Gg: AR+sD10vvtBq3hdoBWDXdc9iRtdIT+ZWeXmyu023Fl9KKoKXPi37FA5C/JR8+zb7eez
	jNFx7hageNM2JgXPc0Z1bn2V/vidiu9GEyZx1exA+HPWqxbyo2M5CgZQkdDqFA+b2joOeFIC+dC
	FynOkKPAtEp4AiZezxrrOHsT5g1UsAlDSF4qD8ht2or/N36C9nrF6v69hgRLQk3JoCfG/sTUv3G
	EqefAD+DN7rSIBA/Qmx0kQhbLQ0cH0swKmNMWGB1yCkU91fWQ5MSqJbYtYISqREO9i7xXvm9JUN
	sX7Qi+0+9kE4ojpbRexY1LvUbNFz6OpFOAtyz8f8+heautDzAMdbrxoKXweiHVUL1uEaZF+oYzv
	oKfd9yYX1W8bsrc8nOjcAVjiYAj89vfTVGQ==
X-Received: by 2002:a17:903:37c8:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d051efd46amr97307335ad.0.1785761203057;
        Mon, 03 Aug 2026 05:46:43 -0700 (PDT)
X-Received: by 2002:a17:903:37c8:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d051efd46amr97307005ad.0.1785761202596;
        Mon, 03 Aug 2026 05:46:42 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae193fasm37538085ad.7.2026.08.03.05.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:46:42 -0700 (PDT)
Message-ID: <14c7d776-a1e5-41a6-aa47-a9ff16516c81@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 18:16:30 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Christian Loehle <christian.loehle@arm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        devicetree@vger.kernel.org, Andre Draszik <andre.draszik@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        John Stultz <john.stultz@linaro.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Moritz Fischer <moritz.fischer@ettus.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
 <178575749351.2483197.6720070407824857023.robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <178575749351.2483197.6720070407824857023.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExNCBTYWx0ZWRfX83tBtPNpHRe6
 rM9cqvxFnqKUc01aqU2bpxkVhkIBF7cxRJCvwno5n0TCATz+HtfBZkxtxLzi2p8AAWC1+uD1yDX
 OHu4k7DV30vkEA/vcG671EFDkTQ4ZpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExNCBTYWx0ZWRfX5HTvz8Qt2IFJ
 C0vFjjFT5v5Twn0wlP+GqVVDYKLSH5MyoBY/ndYzvJ+aLFC0XjfGRcW8y/w5+Afz3TV56Eb3qmy
 k/5gw4eumeVdCNBvvVbLyUN+jSuJSYVP7SH6woSu/HZ33bvN8BNosgl10njvApFUPUgxpjRxl14
 aIe8K+NnEjBe+I3yybE3+O7eou+iZUR2AeJbhx1OokzEepJ9KAqI2UcXMhLDjrmu7jFkljLKMEV
 KVLYZm9LJx5uT2keUmNBqkNcZro3PWSfe+7kkDJ5YN9Pa9aMW0wscazMQL+6N9TbVsA82r16wtJ
 aKXbfgjaMCJ1iLSHvtFFBf4aIX3Crgj7vxaVq03Mfet9nyQZWyleGXqe7lzUbV2XLWjBaFRHwMF
 wdVqZb6TzG0OoNl7P7kANSmR9T+dP/Bzz4oWzW2Sjrof9p3J/w0DumIKee3WPh8Zw4RJ+9tLjS7
 CGNAcgzvHnttsv6b0eQ==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a708db4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0awkmHLjsCMGZ7zvgVIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: pgHqvXVa3dLAeU86bEc4z5-ZGogIe2eK
X-Proofpoint-ORIG-GUID: pgHqvXVa3dLAeU86bEc4z5-ZGogIe2eK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030114

DQoNCk9uIDgvMy8yMDI2IDU6MTQgUE0sIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOg0KPiAN
Cj4gT24gTW9uLCAwMyBBdWcgMjAyNiAxNToxMzozNiArMDUzMCwgU2hpdmVuZHJhIFByYXRh
cCB3cm90ZToNCj4+IEFkZCBiaW5kaW5ncyB0byBkZXNjcmliZSB2ZW5kb3Itc3BlY2lmaWMg
cmVib290IG1vZGVzLiBWYWx1ZXMgaGVyZQ0KPj4gY29ycmVzcG9uZCB0byB2YWxpZCBwYXJh
bWV0ZXJzIHRvIHZlbmRvci1zcGVjaWZpYyByZXNldCB0eXBlcyBpbiBQU0NJDQo+PiBTWVNU
RU1fUkVTRVQyIGNhbGwuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2hpdmVuZHJhIFByYXRh
cCA8c2hpdmVuZHJhLnByYXRhcEBvc3MucXVhbGNvbW0uY29tPg0KPj4gLS0tDQo+PiAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcHNjaS55YW1sIHwgNTggKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0
aW9ucygrKQ0KPj4NCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBk
dF9iaW5kaW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOg0KPiANCj4geWFtbGxpbnQgd2Fybmlu
Z3MvZXJyb3JzOg0KPiANCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoNCj4gL2J1
aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3BzY2kueWFtbDogcHJvcGVydGllczpyZWJvb3QtbW9kZTpw
YXR0ZXJuUHJvcGVydGllczpebW9kZS0uKiQ6IHsnbWluSXRlbXMnOiAxLCAnbWF4SXRlbXMn
OiAzLCAnaXRlbXMnOiBbeydkZXNjcmlwdGlvbic6ICdhcmcxICh2ZW5kb3Itc3BlY2lmaWMg
U1lTVEVNX1JFU0VUMiByZXNldF90eXBlKScsICdhbGxPZic6IFt7JyRyZWYnOiAnL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyJ30sIHsnbWluaW11bSc6IDIxNDc0
ODM2NDh9XX0sIHsnZGVzY3JpcHRpb24nOiAnYXJnMiAoY29va2llX2xvIGluIDItY2VsbCBm
b3JtLCBjb29raWVfaGkgaW4gMy1jZWxsIGZvcm0pJywgJyRyZWYnOiAnL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyJ30sIHsnZGVzY3JpcHRpb24nOiAnYXJnMyAo
Y29va2llX2xvIGluIDMtY2VsbCBmb3JtKScsICckcmVmJzogJy9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMid9XSwgJ2Rlc2NyaXB0aW9uJzogJ0Rlc2NyaWJlcyBh
IFBTQ0kgU1lTVEVNX1JFU0VUMiB2ZW5kb3Itc3BlY2lmaWMgcmVzZXQgdHlwZS4gVGhlIHN0
cmluZ1xuYWZ0ZXIgIm1vZGUtIiBtYXBzIGEgcmVib290IG1vZGUgdG8gYSB2ZW5kb3Itc3Bl
Y2lmaWMgcmVzZXQuXG5BIHZlbmRvci1zcGVjaWZpYyByZXNldCB0YWtlcyB0d28gYXJndW1l
bnRzLCBhIDMyLWJpdCByZXNldF90eXBlIGFuZCBhXG42NC1iaXQgY29va2llLiBUaGUgYXJn
dW1lbnRzIGFyZSBlbmNvZGVkIGFzIHVwIHRvIHRocmVlIDMyLWJpdCBjZWxscy5cbkVhY2gg
bW9kZSBwcm9wZXJ0eSBpcyBlbmNvZGVkIGFzIG1vZGUteHh4ID0gPGFyZzFbLCBhcmcyWywg
YXJnM11dPixcbndoZXJlOlxuLSBhcmcxIGlzIHJlc2V0X3R5cGUgYW5kIG11c3QgYmUgPj0g
MHg4MDAwMDAwMC5cbi0gSW4gMi1jZWwNCj4gICBsIGZvcm0sIGFyZzIgaXMgbG93ZXIgMzIg
Yml0cyBvZiBjb29raWUuXG4tIEluIDMtY2VsbCBmb3JtLCBhcmcyIGlzIGhpZ2ggMzIgYml0
cyBvZiBjb29raWVcbiAgYW5kIGFyZzMgaXMgbG93IDMyIGJpdHMgb2YgY29va2llLlxuXG5B
bGwgdmFsdWVzIHNob3VsZCBiZSBwcm92aWRlZCBhcyBwZXIgdGhlIFBTQ0kgU1lTVEVNX1JF
U0VUMlxuc3BlY2lmaWNhdGlvbi5cbid9IHNob3VsZCBub3QgYmUgdmFsaWQgdW5kZXIgeydy
ZXF1aXJlZCc6IFsnbWF4SXRlbXMnXX0NCj4gCWhpbnQ6ICJtYXhJdGVtcyIgaXMgbm90IG5l
ZWRlZCB3aXRoIGFuICJpdGVtcyIgbGlzdA0KPiAJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2l0ZW1zLnlhbWwNCj4gDQo+IGRvYyByZWZl
cmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6DQo+IA0KPiBTZWUgaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2RldmljZXRyZWUvcGF0Y2gvMjAyNjA4MDMt
YXJtLXBzY2ktc3lzdGVtX3Jlc2V0Mi12ZW5kb3ItcmVib290cy12MjQtNS04ODkyODEzNzM4
NzBAb3NzLnF1YWxjb21tLmNvbQ0KPiANCj4gVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMg
Z2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5DQo+IHNo
b3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guDQo+IA0KPiBJZiB5b3UgYWxyZWFkeSBy
YW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlDQo+
IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQg
ZHQtc2NoZW1hIGlzIHVwIHRvDQo+IGRhdGU6DQo+IA0KPiBwaXAzIGluc3RhbGwgZHRzY2hl
bWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBy
dW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlDQo+IHRoYXQgRFRfU0NI
RU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1cCBj
aGVja2luZw0KPiB5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0
ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLg0KPiANCg0KdGhhbmtzIHdpbGwg
Y2hlY2sgYW5kIHVwZGF0ZSB0aGlzIHBhdGNoLg0KDQp0aGFua3MsDQpTaGl2ZW5kcmENCg==

