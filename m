Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184481;
	b=IUO2b/Ozt/UoA92RC3fskT+pzutwnEvYlQDHk0vGw7qWjx55+kl1Sk52qtAY/rYdOU+A
	 pqNvwwIBj7Ew7Z5vp71q2OAFo9lIxUVU69S204MOL5ZkUOnNRhyAJogI0luNApT9M+aei
	 92h2hRobtZ5wAeqEo0QZYP9jY2+xkJ+mB47ByddOQhcCVqa2/XyIP5HCykP19CUjQUdFJ
	 uHUVfOYnmvvvYvDpLZWLyMi5FbX3y4Y0UUNLlEwBgT8j6lre3lDuZSgHVrAHaHAKQMQY0
	 IvJSfsjZ/AEC16kk3J7frWTD/f3VLxo6habbkNV5iJ0O8WsHrtRqZWoiyFBdIb7sWUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
	b=YVbuKyH51RvYwbpaYWE9AYUmBYG7L39Wyw1bKf87ms1d0wP9R6HaX5hhSOh/nm1EDVgc
	 r/tKiVZJkSTDrLfv2UK/SxaORGBfCHI6LBU/L4l8a7JFhrrRyQeCXyvL/G5CX3E/LYdgR
	 Q0upvFClhTVQNwPnrEpwOnTYBNMmQwfc+heGyfc7t0WqYvjh4cTZZkpEiRMN5oD5p7+GL
	 syKS8pHmibZEqHchVHTnwXxfgS2WtGrFe6MNLvsTMhjqSxKVO2nL3YojG3K96Qi1SrBWx
	 lOIneAzKmDMnVVVzuDtOD6voXIzsk8U6oYYRB5VeWvlTsLBA5bvu8NgYSbzf7kp6oRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DijNxLRc;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21D2606D815
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E21D2606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DijNxLRc
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48fd2e38825so235743f8f.2
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184479; x=1794789279; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=DijNxLRchvX1D78tCg+211HT8PnrYpR4bNGwuU4W+Ws7b7aebxWJihbpYwVGzC6xqs
         sPYn3+QQOdtMV3fm70Ijeuv1cH2305jD3W3V4JrmIqSDRZ++bh4GDlt2KC3495YpPE3s
         ur8VeuyRyZ7Fj2M6P3NgcZVJ1Zv+neoXFgO+Wj3dHHKRDWuLxL5XFiQbOw1/8/sDawWF
         FC+fRdM7fKLYQBLtIdYHEtdVlmk8OSjbRpWTLjRbTJYy2G5CHm+ofmtK8eMcN1rchn8H
         kS8zujCHgqEbsNU+If9k/3FFldDrKCqYHS368bU7spEjrLF7EG8WCx9Rjw7FYV94bfHM
         /gpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184479; x=1794789279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=zvV0axp37SB6dmv0+AsviLOfOGCOzw4kBkuZQkrCC3jgftdjnjbug+v8pQ1JUegJ2s
         mZc/pBV4aTNxYzb+40goMUM9p1vXWjpyouagpeSuE0CuVri4LKVns1cne0xYXcVCzRk8
         7yXEFVMg6gVmP3EKdovdMs7Km/e3x+885dNZ9Gxuo4IQGy8KVan1Cs0yYT50ALl7qoSe
         dm+lQVsh7892IO6dyjokY57y9QHxOhf+Liw3kzl14cFcH95F2wKn/jgJrnxCeVXAkRFj
         dvg5ukg9Zofl41F44WUNfX/V0H9/Mc3ogyuXQQP38Gtw/CHk85gWvrMfSZ/nfbwKrf5V
         ufpg==
X-Forwarded-Encrypted: i=1; AL+hErFTqDK/GHYd1V0xbHzhxtqaIZsXE3frK/tYpeqnNYf/BjYlPWYM8L2qmHoT24Ltegk5888=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Dz+IM/ijw5yk48MCecckQdM65p1FHiSVPMsT+RC47OGXqX3Nd
	ycpmkuKwsPWiDOaPAOBItsJZfylZrtXs5WTtk/l1b5QGT7rXGR0E1OCx
X-Gm-Gg: AYBFou36qJWExQoroAlgqZQ6I35M/WBaJDTJDBSqVxJdc6utAdTmZHkQabFTO5OS957
	VXKwMl+qC0Wa5y5XE7iRdPsQ3Nd6Z/m5NFbSq+SD1Ql8h2L4rVhbnyn3SUex73NbNlJrw31zZoS
	pxXV0iyJQM1JCgCOlcpSk4xv+bJuvJAHPoKab4uV4YC/NK4RC2WfVDA1N1LNrjLCB2xQlizG+Gp
	/XYNoH5y6mnfbF9GbDCfVBU1HoKD0a4hRtjYy9EOYJkjtYd0OyeFi2kK0csU4/lIj6RfHCDmLUh
	fLtL0LTaY+83S2xO1KEIwogJr7Dd4Jmrct5B6ZhAliuW0oOgBn9WYlVC/2yHYWi1cxAgugXC7I7
	Y9G87zxP9KwlNAjSfZY7giAaGZHr3ic0PSz+oKhYlY3tQLuBrDdd8AR2Rn00YOgK20LLN2TZzAv
	8vLyoCntlUcLuVwxAHBtWZ0CIfBFLPiJFVBzu2qRPpsUXB8unwa45NF7eOavFIrAafdicrWIZai
	0TA2W9elX+QSlj1RUExGdwdds78NJmJSMQxDqbNADIBPjTJRaeyIDWpR17mMRm6Bj2AGt6FGKd8
	4DSW3W8j+tSjpa7Cm2p+0vTx8MsmCyTSSlADRDaQ
X-Received: by 2002:a5d:6f0f:0:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-49586a3c015mr4911501f8f.3.1794184479389;
        Sun, 08 Nov 2026 16:34:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:25 +0000
Subject: [PATCH 13/17] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261109-halliday-dts-v1-13-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=Nal1T+ROAiQwIycyxEfKMIQ4y4aGW1L0uJ4HewmCRmGIZfSJuQVD6Fg2qPRcOrHnEpA/WiD2I
 u4aa5TB+J3JDBwhP4O82nlPD61zqIxNlRPMGwQQVcuKGnMJPv1tp6Q6
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

