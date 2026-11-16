Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864435;
	b=cJnGpoC82Fjl4r/Tj9xsQmtAmWk+K8qm6kw3Ivd8lY7WnEeb0hx6590tgFKkzHSz80HA
	 KAqXh0H0DwO3iCf8xHWiBytuOUG4Y+RXY6Gd/761bObI/LQYDCdhDwJTyJsDxQfRqytKg
	 zOyNjM7SkUiEltduG0R8DJddjTDRv9LCFnXjicr8K94YHTYGk/jsSbFcu+FfzcagkSAC5
	 jSar6P3D24YgAhuWVxDsZlHEhbqJcZokPYkfpRG+xdahijUhRjqYoiBH0cEbN7cczhKMd
	 sRKEFh3vnH1n3gHCE1Q0e3euLEW97Pssm4tSUDLuBF9EjWUx3DovMKffMA4VrXJE92A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
	b=xBJjh04gF3per9T668kTPWMAjU0HKkpGt9u5Jo1iu2DXCxUuKWhRLpheqe/goy+WOT35
	 Pr7gJmb2ck/viTae2xD3WrayN11JeBt9+aLiL6/US5p1VCssT/NJzBAa88J7L3UtWVq9i
	 YuAp4VUGKBDRr65avo2TjhZF7VAKspLDz/S2rOxWjliw+hAxUU5lcWw+w5oyG4APBhE9H
	 et3hJeaTTfPs8LboF1Mw9yXdjOfIuOJl0dK2vBHyU+c0bMuYLEgdjTRGAIz3Ov/g5/abN
	 K/OJUYMpcTMp/g9pwJBN9UNtCc1JeixelH15mZ8tmu/M7bFpuiPIWFSJLS3VF99Dzcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyHOkOw1;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B7D606A330
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B7D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyHOkOw1
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1997449f8f.0
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864433; x=1795469233; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=XyHOkOw1/bH5dybDt73kUZCufJReDcOltXkEa+zbV6ULLB8ACFKcOKXdcLcoambrJV
         EdTZ3sqchNTs6NKHkru3fZdKpDjPB1WmOphWBxp8wM4wR4KT9eREXZtKISke4nXvUK8E
         OQLC0J5d4wZjxLJ89LLaB1HXPO+2gMVtVU15OgTM1zVnykkdbUW0VqguXM9QYrfakqZc
         HT5+p3adI8dVAyH8sl9ufSO1T+RHYFAbZv6jMRqaVUadrTAedKsb8qFUWOQ8HrbPnkJ1
         uD6DRtLuFkTjnDTAtgT09U2OGd82Hfw7wtg1/S641xrcAXfgvUZr73SvAex1Qm3JbDwR
         i+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864433; x=1795469233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=JbfNP/7vY3UfJIHs140ig8+AluBLZ6lsVHSRU3OMtOwzxxrijKRMGw2A/71iZnDtpV
         jBVtidSUqN5ci4B8Aw/zrS7XE3aWEqZnOKoSl9i5BoLMYcGYYs1BW3Xp1Q6qtcFUu6ye
         yvDjgvu5LZ4zp5addWYSSAC57sP3CaO7WC5NjGc6rOjn7ZPrTE4E3OS4pjObdQenq/Sy
         GKvfYLu9+ZHMohLJ9hYPEsJL6E64W2pDTZnIdPkWfRwTXfCJpCiMTzl2XgPt9uFQnym9
         iKjuobI2Bg7MAh3du9UDf1a23gu8f/0GHpZx5wXFJ8mTD8ufkX1AvnZOewkjFc0VouPG
         530Q==
X-Forwarded-Encrypted: i=1; AL+hErEwzdKNUkF6YyYenxFAYeArZOA15G+t8jSi3ZmIdk1wVRnTHYNthkqMl20bgH5fqqr/rg0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+wcOR5CSp0p3n6n0572ezo3WiF0kbQSLjOboEx761D96lT8eWT
	TyZnv2txc0nNhhpOppYmfqOE0RwyN31F7d6DR0V7ZovLKxvwqy0ZE8/9
X-Gm-Gg: AZFdTZcIRIehS0Pyeh/ku0hXt3MRh2yVcdGbbo30R3+N3FvmQl9oJuJcgI6SReuZnA0
	rxHsaobU1tf/0abuFkKHk/UBiVbW4faU728njS2QVOEf9DFnxBNJHBUVvQfA1Fwo1SMmTrOrGRb
	Mj30VuVM+RJImteQuHcOazeJBRZR1B99r4tW9wKFujOB154W9W4+pReiyojM6Olb/gNomrJtQi/
	jdyVp96AEmkdrCyMGW6OaWkcrGAnu+wlCoccDbV+4P8LNKahzWiLyRkpHaZywNLEyYUIYIYUEma
	ksCubAjrTbRjRAE6n4B/5ki0l0AHcVroPCFrUPo65C5TzH8WBWuLxnwwyjjJNgji9w1xW5OGEPP
	zQyPYGbCogfQNlhkkE0SS1U84lNww1oYrHwSk73GBQPLwArU4Dvym+l5JGwitRpAG9q9Ke55kel
	2IvofaJoifdlhLRFrGwwvtHOPDD57rpWtv4qIatmjOjFNSGfXxuEpQvfaD/pGcClZKYcaIP2oa/
	nj2celXoW21B5FgUWdY85wZWQNwVSXlqO8r3XLeXLaUcs1uID0Pfv3LmyPKvyBYNP61K0YXpYQ8
	TLqC516DgExHLshC+mka5QcudwNEsNpFfVsfsPbN
X-Received: by 2002:a05:6000:610:b0:495:5c83:51b9 with SMTP id ffacd0b85a97d-49c7467a893mr27328310f8f.50.1794864433590;
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:22 +0000
Subject: [PATCH v2 06/16] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
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
Message-Id: <20261116-halliday-dts-v2-6-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=XlBnHuuXKSsmwBoy79zd7CM/aQS0V4vz73O5I/ykrhOgY3nFJG4rnY0qnm4zfFTA5sK35VFT6
 GeLVT3WztE2DdDA/hh0iSPFr/rHt5tVJ5B9S1do1YbNU2FqHh/CJpdT
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

