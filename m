Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864464;
	b=fZIsjzPKjGl8Lmajd3hJNcAvvGHkoi0NDI+FSrcaE+lc2Luj23CLXcr27pk+LmmVNbUg
	 XPZteopIEBq2ypqUl2yysTmLhPUoKcAHlfY+ejX02UOa4RuULNECnkV5rVSar4QzpogK6
	 FZv0FoiGS8IczZv73lQ7r4a58YgRTlVgxHfQ1mfXOAghfg9iP5lo1aTNEbo2oBLyyNTG6
	 M7SgbG7fWM83Q+/iO/TvaQFBm6+pDp8YhKYBFSWzOyEfu++ud0AoHXy3XNB/pQ24j6PTh
	 MRv8vIRtA4mfnfsft7BocSfvDqt05VjEo2sFkphqeUSyTME1n3DulVT8eMDTxSHW6FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
	b=w2oJ+SXqZpStlunaIwEK7kGl8TaZP0cMQzAhnUieUoEL5WAuZT4+Ofb2OudbiMDnorR3
	 DLgNapQJP8Z0ELCdlvopRxOCWZ3igqwjOgNpFxcS4m5voowm1P/bIUNkwB4G7bEWYjPlR
	 j9baEyTp1wzw/tHK2GpDTlnpOZm2AY7V1L/rgVNJWnfD3gUw/o3mbrX7YWCvd/VTwJT0X
	 UgLW/Yt37Xo7Vd4t31Ii+15l55rhKoBikArSWDpAT2a1OQa1Z2Fl4dB2SbGgGiTs/nAA0
	 Bvtx2IcTI/mz6clCkNPXdlp8n9bjQrS0Icalponq9siFw1luszEdJsEBt57QLFmxfcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzfNjXbV;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2BF606A323
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D2BF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzfNjXbV
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb606491faso13530235e9.3
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864463; x=1795469263; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=LzfNjXbVJeiFNn/MvG1ijUm146bvj8LsEZN+fpkx2Mc7T5FND8BeT/HHc4/HiJNY8M
         E2BgC5TUF14dR27zm/A8jgXDgSO6T4fuh9vugRyVAaY3+9zG4QTB5jHAqQ13qs0VDa4D
         nfRQIG8Y9auGhp2hmPwyDVGDrymjpwjPR8dYNSANG0JK1qP4xc704TqhnYtMTno2sCa2
         Yq/89mLdncG2hf88euKTbCt95LVMKR/1iuN0gwZurBwqMpH7p+01vBhXyGR+wgb3E3Hl
         iGzyS4bx4GzcOONVsV0U2t5TPlUZh8xm4TMsd8XfkluEeqJ8qGtHDoAjYHW5sjvbs9VI
         8iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864463; x=1795469263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=hFqjC1IuakK64a4zTH7NeLuFq6rAwdLczBN6Qjio4AQKIzGsVJkdvgVEF2LATNrNv0
         SBmmfT1B0F7h9LEprl7RrdT+xZWkYXcb5BSMua7j6iRGLUXKecwc7jYK5+gtOIa/DEFy
         106nWAevI6L9YcnREBYLD5qRvEdIBl2jOY2L3row+XWzA8VZMg6ExDZcsWKmb8URncP6
         7i3EXwsKNDWGE3hjEdAiqQE3ZaGQwBFo+dzRnQzUUWqsXgXpNTjdlVx/wrRJwBmT/HXu
         u3ifiFUqt48XOnKbbw2A3TDDHsLaLqJ0aTsnM4ZH1NGq+0BBsZTfM6TwmdWhfq34xW5f
         q+vw==
X-Forwarded-Encrypted: i=1; AL+hErGHqvTOgi61/zqi983bhl7IY6j6owf+pjPuTLf2utgDoPEpvjkUSgbzwLVdLL4ZBTi+uJE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/QzNhrEusToQMD6//MTR5gisxptcbD0Ivde4gIKlXtny7xogrd
	K9L2NVNdveYeyypo8JnRtkUE2dkH0H+t9j0TDBbUwEZ3PE5+PCEAx9xU
X-Gm-Gg: AZFdTZetUdKOQ0V1sk6yOQCsBCZbA5oXPuT7cyEAgWVQm2fHnT+Jse99WaXaMfx03L3
	S0togWQG9Yy3WlDa/u9to8WGaacAHCoI3hNdrNjc3FJCPmdGBSsFfqVPrFElF6uem4Ebe5n56Bl
	zh/2RueHewKUuK7jDvj+4hnP2mFZL7ppBu7YyeS6Y/eFzrbKpV0ueeitkvcfGbEl01eLoQecXCH
	C9Rx1E5jxWVcjsxaknJRus1MncFPfI2a1A7FS7Ad4Yl3x4vwVl9CFhUrYI+ul9eRLRwti/XrZqZ
	R5xMQw6ow0Zl4FFUd1Y7PHUzWpHXRnO+SOWIO+TdfdqLCL0AuxZo1dq4RzS8cObOrGeSm0CKIT9
	gZSlyD3DXz1PlnuJkBmuRwNxJTlcP9/bdu23tLhgpqS6N0hnCJGG5mijXCrAXuV9q5BcduOz+c+
	PKD7K/dG27xSRo3OjThWqLoiomifXZelHBe3Xjt+e1HvsyGSVy45EM4ErG3KZCCseqsg+GI2ETx
	R5d897E/XoVvOMWan0H5ow3MmyhjTI6whR7Mk5MQfgwpE9z6wCeoK+xLuSHv5aU3sOTVzsij3O+
	RlQvk8lJ+z1FyRtyZwxRMaMEVIA2VfI+zkVY1GRe
X-Received: by 2002:a05:6000:438a:b0:491:36b3:22c with SMTP id ffacd0b85a97d-49c6e68dc41mr30686056f8f.1.1794864462819;
        Mon, 16 Nov 2026 13:27:42 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:27 +0000
Subject: [PATCH v2 11/16] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
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
Message-Id: <20261116-halliday-dts-v2-11-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=lNijzEKQlyljkWzaxIS9zrys8uC5qiwJ2YpuyG3Kr+5tC+QMb+R4Db6kOwLBwj0GYnOv/QX+7
 5U/HlbRtrBQBhLGehnhSLzxDVWEhcpke2OLw7yIeYTlC6a6mrQFU5kI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

