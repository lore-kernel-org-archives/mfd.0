Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C145D1A4
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932452; cv=none; b=jfsPJKAVVdPmb4wwyDDXJJ4WZDkRz2Pt37/o3M9i5NE4buPIZUmEv4srmH0M83b+iHVL3Q1O5XOgFUqus1wLvtuCtEOr3HePbmipx+hX05+4EzjZHn0YtK1oXjWIA1Zfa1kcwYP3in3FFo4Vf5ny7lcXS7EIQFx+nr9x92pp1fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932452; c=relaxed/simple;
	bh=f7yF4xfFFHIj3dQvLZwaPrGUwIwSiMCTUNahiYRsF5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XT+76AweviO88RJYdJvEaUQDzkSQriaEDmVweGan07ZUoo4qJeqxPubrw2ztCMZTwi8wZUX7fvFgS7Uw6CUZBAkVVNyHxh3zXlyxcxsmKq5tIgB1NyO844mtr1cQCKwc/Bh283absjN0mXDv5EpVJC/pxCNGi6xzrJUUSyzsQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Yivxltu1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Yivxltu1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso4464115e9.2
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932449; x=1786537249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/7dhBSgukk8ss4p9GXKM7Hns3H6z46vF+Aj0GzKdlA=;
        b=Yivxltu1EWWBydvMtbeuZ9Femhfjiwte5ZxCMTzI1PI//sAfjtw8etmm6tADo7Xrs4
         ltY4QZB85OtjDGDAXJly3pdwcLBvLTHtiyGxma5vAQT4/aP1TMb94vBMxQhE0Z9Kv4kV
         zE1KjQMmC24NynUtab9bQTDJ2cst7DD7/+SOJ9X+RgdD0swuNDM3gPPCdJkrK5cPkHBM
         +Bdes1qszOzlBMuv+Iyl79/SJIyUhf5AfTP/fYiyS9H1F7JTjec1uBGcpzUJvgchUnb/
         3/XZc2NA8sDBy/97qVmL6Kyw7R/ZbX3BI+dYrMO8cttic93bOVudYF9ytvLK0+8GEP2J
         u8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932449; x=1786537249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/7dhBSgukk8ss4p9GXKM7Hns3H6z46vF+Aj0GzKdlA=;
        b=Vnk6oVYJSkicLnuKycTEekL4+BrL07EzJdKZaTT1iwvfK7SgQEz18NUMmzxd38qsWi
         Dkbja47BKCQUvcShYt2UN2Hhbno/Is1f6vYah2i8h9EcwjvprbWMl5+dJPy+Gf0Auf6B
         h57AKO0eYQ+L0UxLLddGVrwocncWkFdkswB0a9C29wS1F2AsglxEdKCbZzF9fZIj7qhB
         janl7J3+aQNGLWe1if5vuaKmvS24YjPsPQ4ywhznrlhoH4oEIt0BI686MHoMlP5ivnxc
         RPJrlbGm3XvnqwoVf9LrG/TqIHY426C4kPkH3Y2YUDFHNyDmRkTp6dpckgvGzkGPgYmz
         K7jQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmZwJ0vwOpWVxj1o5C2KoebDkNDO4DS35gzvx+3JB1CZHklgMpin4l03O75cHIgEfl4do=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIoI93S93YIi0u+dOZ8H++cqqXZp+DmXxy3Q83WTsIpQXyRkyv
	uIYumIIDvrdj1ewJ/F/uLEVBntAPA4IAUrBUBruCN5/qIvkhcw/o3eolnH34XXwYpUI=
X-Gm-Gg: AR+sD12M4PzspIIWiuKIynS6iyi6+D2KZkyNPZMSUQDyfEU2xAu0wVMiPXDgkK57NGy
	Wd8934eTEpgmrSqdcSflzm/1+eqgNaYexbIBzWuM0zllD1xW6g6lme7VXoVZrpylhT4wniLZXB1
	Zncn0a91wE7Iud0G8M6Slw1OL2i7GlJf1+H1PmsvegzgSz6iosjIXhqhGG3MYfp2ZvWAvXmr78Q
	8WTYqsETT9ukSO0HSV4LEATmKi7UStti97s+dZAzGOFQxvooWXOCf8JGuzJ7I63EmaTnh7EWZiT
	dUag9cEuB0nfjPBk6MCbdTU8RsYmA/1QaTcjLxHt5d6ZAk7PmyftVaFz9Y+neT/2N7KtXUsg0eU
	xTFwo9AiHUuNEdNC9+teoB9+an0lmb18t2hwe3SaEOAd+p6yV/4kbiEoEk/hzMLdxjqUrpkifag
	fBGT3Btsby9b/ds3e3nrSF9sk4hUutzH7v6jTwtw/4g2ihWEiuwPAPqhV5ZXlpI3ew/TiMcyywx
	31qt1rQAr9TqpHjBJ18MZ2VqYXEiaA6eIfFO2TxWgO3yeupl1dfQ0ux6mjQP9VrBmCJb2dj6Fc7
X-Received: by 2002:a7b:c7d6:0:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-4994e7d17c3mr61632935e9.18.1785932449558;
        Wed, 05 Aug 2026 05:20:49 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:49 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4
Date: Wed,  5 Aug 2026 14:19:53 +0200
Message-ID: <8d24d424b3504105394055de268e0a11515635a9.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the syscon phandle.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7c02633f2bd6..fbd7ab6332a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				aspeed,scu-syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
@@ -742,7 +744,9 @@ vuart4: serial@1e788800 {
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				aspeed,scu-syscon = <&syscon>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
-- 
2.54.0

