Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB07E45516A
	for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049114; cv=none; b=SxqmkMmpFew1Djx1zkUR9MbXW25bkfy2EaNaznQwA1UcN3hA8B/8zgS2Zyp7mahj9g5GG1IoUOqgu88HqKbBmBtn5OWJhmbVanv4YmDeSY0byZQeTy+SvbTSD6Vc3HQpsQSkmuO1ZVSrDVFBSalrQcXbh9lRgCf9ELB0jH4rnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049114; c=relaxed/simple;
	bh=vfIcMF/D8wcsUdtVGgWk0Xhn25+5CnrW+64Wkzh62KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OepXOcN55LBwNJ0DdgDPmAobLcV+FD+wLhnQaQVLGhARTblTuX3XNXY76lIvuCy7vinowS/G0gkuCNu4onlK9oYoAnBhDjNuuqSQDRJT3H3b+yY4JOC5SM9vFY+IJ80NExLPsc7BE7YXZ8uf47fDwjEt3CFCeRgqXcuYE+Tag0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=KirjD+Q7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="KirjD+Q7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso31358775e9.1
        for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 03:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049111; x=1787653911; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0US0ozN7L3SAjOKyepRf84tawF861oB4+zMdDmmleEw=;
        b=KirjD+Q7b84056IzQ46Z+ZEwZFk0Xxxa6eDpeP7FBh/w2OcNtPRTt9+EGx05qVdIAW
         rUJM8StJngVorDHLTHcap4cm6ea07klG0fjPyMyfU6SVd++Z7YNmHeQE2Lss3u2H9ajd
         Euf1O4vjMDZozRHlI8n4aGFq4Qby+7/sLQ6Nqnd8Dni4z2+UAzhcc1fdS9Nl0z4XIQIo
         3BXhLKS8SRplvSP6f7sRIl6YVj5mJ1yL+sqnZu/e6M1rt/jrbaoAHD2rTOT4kGJ/giM4
         7dG8bNFpDMpJ9Z/WkkSpgeSAfo+lvE7jiIOfIev+piQEYejSBkxTKbRViI4Hcy91xTtG
         PgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049111; x=1787653911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0US0ozN7L3SAjOKyepRf84tawF861oB4+zMdDmmleEw=;
        b=i/H84l+jtRF9qi3DTJ7IQUquBm1EkPoM+IYlB0zeG4GzWUTfdcpNgrwRx/9D12rb0c
         LF0a11QyW7oycxtK/2xYGJCKs9h1H6pZsYHdrPRT6TVsxhsXUZDxHeXbEvjGA0Qc+5Rn
         nYhvLHdqxeCFvVpp/L/UscrP0QOocPoeVLHO7yZZFGj+t3tJy8RXXl/eTNL9NF3pPEyh
         /vWuWFDsLhkOyN7kMs8Jmza0LUSD/QCcJPmdl0Qt/YtjPi9dhdnz5aEpMKslAG9to5gB
         Cmi+51tVIYrJfDnUQ+yOuAiek7qeIlDeDeWyD7AKw5HMFY/fhzpTnYZ2rURHgDgUrs4L
         TSOw==
X-Forwarded-Encrypted: i=1; AHgh+RpCiwsbs8oV6gNTszzQUHKpobJlaY6I6nQXoXdtfyz2olTGCJmcis4YI2t1hOm0vwLqeDs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRfZ/tlpBE2PhnVSZKvEciUPNesOYNHoh+/AXOgpD3M4t2T+CS
	M5pqs19YMxbI01lqxqxfnF547RijBDA6TU6rhPWCjknlDf7cU9j/fbBizCcmXn4dJpQ=
X-Gm-Gg: AR+sD13/1eTxsfSXV5wGkAFYx9tEtQKJ+O07uzc2ottYiTberfnMmn2UuMVG6UDtd+A
	UeYqfz506fdlbxG4qgW2+GDxNZn6ZLcFzYm6lFFHaY5BA+Vg4daQEJWXKEfHN8s340FvaFpOaxO
	pl8ILaDUqrxvSVWvLdYnwKiLrV6MoZQhl7oAD35/9eZxPpVzR/VtOhj2vRAFNN5ZppPnGHEb88o
	lNKu3SBDPUlPpddYKvpcVRqtCFULOKUPoCkCmeE9kY8O/wJjxtF/JsFwJ6mbFjBjv6bGpogXzXV
	EbwJI4RclNrDZ44SkpptvA43rSTsIHu6KEUPzDqLiq7/pSkP6jcrUhv3mb0nRtnzF9DTcpGXNYd
	dEtz0YPvHSTVeHuwTSTerFsa2ebOwgac2o0LdxIetelAplel92Bbd2j5Bzsu1G/NR3D88d6KDI1
	TWiKBHkvstVfr0x6wcpn8hQDh1VB+i3UWZsW+hkXmU1p8GDH/G/oIL1LajONgVJluk30rEJAIbA
	R7jyjh+O8PI9FYJ+NM3R0lL5tb0jOpn5jcNaN8a++yJG+4kYP27XiHXlVQ+
X-Received: by 2002:a05:600c:1d27:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4999fae4e89mr107830385e9.2.1787049110979;
        Tue, 18 Aug 2026 03:31:50 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:50 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:18 +0000
Subject: [PATCH v6 5/6] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-5-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2

Use the ast2600 compatible string.
Make it more precise and enable specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index edf4b74f5aba..c952e2075b4c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
 			};
 
 			vuart1: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -717,7 +717,7 @@ vuart1: serial@1e787000 {
 			};
 
 			vuart3: serial@1e787800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@ vuart3: serial@1e787800 {
 			};
 
 			vuart2: serial@1e788000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@ vuart2: serial@1e788000 {
 			};
 
 			vuart4: serial@1e788800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.54.0

