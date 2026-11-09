Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184466;
	b=O59fOZ2FaRzPpbPYCQRRPNSLTk1tnTfIEkQLnXA5K3w/eJJ2jRQ+VpNogTjBkx4ycJ6g
	 HsojS2hAi8OWdz2UlfOHtjx+a646vuODDInbi31tycLJnL2B4qG0iJu0zEZkk59sjVN5n
	 fAiAFq46NAhbxGEJQpDEclT99BAstHEf8s0lUmy0LI7UuCtv+Q07qkuW8hncNdtYo16zY
	 fbYVtqd/uerfgRNs/1D/5nFAup09Z5YbJPDkS7tj/tI6To0Wx0A6v6MyGcxyE0CppnlnS
	 k7NH+JY6pFnreZVNSoyi7bamODsYlSRnwL9PLLb8EUCkr9novMKOVs+rL2k0/vrDhMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
	b=R2jdpMb0/tgxdarInr1qCnsg9gqlgBxCWzZqPZjPxR8Pc3uojMDMCFoQFGMY25pqam2Z
	 TwF1WmOvgyj1ncmfq+LZEOVEkXfAToIj07sM5hURxBZBAIkol80dmAD5L4VF1sNToDR+Q
	 Ak9Sn6GPDMExTaUfRqbElG6yOYqc7jov1jTBdkJTGI4YzM56yZ/49ukwGFe4a2GO+KGAd
	 /i050Y1WGva7H5o5Qj8haoEqNcVNeQOQFMGAsR3JcFTUjN0mA7uQeaGlPQYWfU6tNXqGh
	 MJs5uiAX2pBJ5Y/oA7eAGcmsCVA4cuxqSj34SrfIyGMRFhTpW2Vs6ImBo7V+aCRwjNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Seat8WKG;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C1F606EEB3
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C1F606EEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Seat8WKG
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4919a880834so165049f8f.0
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184464; x=1794789264; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=Seat8WKGzmMs68x3d9uGDTCWGW8g3g6b0F2H7aDDyQ8X9GQi6gixZDnl5IlKb5EKqr
         IBHEdmkRi6c86A/tOhnT0qZtPD/3HLoQNOJxpKtrPmxXp2PrVoEdgPcqDVZ679yjbE8q
         5kfHX3XbTvitX3/G6njX49jgFcqfVsb4foMcAW6leQIbTNTu8gq6LXHgkmy7Rm4ohyMG
         h2TYQuOjKZi6HUVWORtpnquml0NPDS9okNGcjOphg7tdS0asJpJsjhagMzmSOojTTPI1
         nCwl6ct25SmrW9Xgoc+xG3Q0+ENV7uv7TN6qfp6qoGqFbf0QciXc0poHVWRPAPSPYDQ+
         ZBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184464; x=1794789264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=LN116nMWNz93yVyjDUGD/PyZFc4JJebPNcc1nv8qh+hq9tjdHRlJfYT+sBjNInQsuu
         pzYf8QN0sVXq8cL3OBiXXqw4BXo6YLNxS4kIwPEJO9I/teqTM4iFj8oYlstrjotiFqv2
         rr/jrYVkBG3TnqIqcakqd0BmV+PRTNGi5tiRClEC/qZnLsjW2i5lieYnCy7W3gVPQpSa
         HZleR+7p/Jk/kRT5hd26Xhyk9hcVj9O+oPil4FHuIJ26E5n+fGG7n59qZvsm4sBq8v9v
         szUDFDDfV9CWdHQaeEukjroXWnT4LUzuazCDbce3PEf/3D4WNZ9f7PI+ZoWgFwmvBTwN
         kPQg==
X-Forwarded-Encrypted: i=1; AL+hErHBjYBE/NvW33kG7Bikj39mUJHfJnokvi38oJsm8mUX4RR7XEeQyRh33o5Ta8GGIRcDtxA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+CF8r/KKjl3DygEmA7ZmZ+WPraXzF/tiBn0PJ7FlzOwf+f9syk
	ju0hYuWuD+Zv87MsNofqRlqYm38dwlgBAGguJg0D5qdAciSV8VSDZz91
X-Gm-Gg: AYBFou2pvwClcHLl24dIimlykl0xVTnHF6qjpLuags+KC7CrotMFju17ZBHk3mtvH6p
	NxXykKwjtLFgD82WqI5d6LywwlyMX/YAxbbQ5mgEcllboQS14smJrPMdahob3LoT60crvhw3itl
	UczKQzAF/KED3oJB/afO3kIByTWY8p6yvL3M0Bj4ZDO8euLVpJTuCZZoaoLrbn7iGWBU2bxs6+g
	zj8dO3+tKGi/Liz8Xf99K7m3wZpkVyvUlgRinHl970iobIEwdlkiY+/fO1oy0udEfbusV+bBuBb
	cwzChWWFhCmRDH2BJvsblJ65TvEt85yHiRLfZBVc9KwQsfoqF73injnZVUeofdaHrAumxPC8eyE
	xG08HhEBsDl5eBq8QXeGexLkO60ILzYMs+Vi1w8BHyDuPxB8zvqBycGKZ/0BNiskZqrlIKSguax
	DXfNGmXKiyJn61s80YQBZasmLW5FSvpnmaiZ8fBzxPVaME0818oqfLa6qKHoQo2DJWCbaqUnMBE
	tYtuSZR8RsMA93h0Zd387PpLu45yWEiGwN2crOCrzeXFCZceZy+PFJS0ogEIkwlSnqiWwvrOqOs
	5XOQd09rL5wBs9FwAYQLzWxhlF3UdMQy5aVjgK8g
X-Received: by 2002:adf:e19e:0:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49588ce1818mr4774036f8f.25.1794184464442;
        Sun, 08 Nov 2026 16:34:24 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:23 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:23 +0000
Subject: [PATCH 11/17] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 Halliday
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-11-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=/dOrZ5kbZXiJ0bcfGwkBHl7a+YAKGn1bUTdYux1Y38RVDKws5L13g0SU1+8SFR4l0gLQgTvYS
 wprUB1wAKuOCKc4gs9aCLEB0eoMZXLaWUvR2Qma/3ofWIp9EDkckTFe
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

