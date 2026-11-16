Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864414;
	b=PgLgV0F6q82R6DK1MAhqQ1X76plw7o7QoPSoTPtnsYy++PTb2wobNjiyG+jNNcTGcPAk
	 IijikDWcQbO0rr0VBBQnm73bToqhX16apV218lmcsPM2xxOH7y5KxmUOddguEcRvrWzev
	 dhkCIDb5NGE9wUeiAVI9JTASJNGp8wPP83EXDFXdJ01ZZsibQXfRa08c3c1BdcWbF9r9I
	 HZ+tPItSYHuqJggY22J9OYyRxhBKYmxbtINhrdfVb9yWjdpXrVM2n2vLVL7ccQk7bJp8r
	 UN2aPXcxL288KUYE5/O7r+ZNIFzHXa+sHxaFyPHTXZyOrgqQihJCQgM3594Tjb07+dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
	b=HDvhlA5tKeZkVS42RJErtEWASEa2YsGvVhSmXBak+aGAtXo+PLbsSjwg5CRrLgquB9G+
	 8233PVpCkH9C1ayTw/rIYqJ4G3kfR6m3NyOgNp5iDR+HMFJH7uUM+rzzgEPE1JFTu9kXP
	 3vmWoUa5hPf+gfYrn6lg7JYwIyVdvwvimikYY/D5kuCI9Bsr6IDWYzwk0G6eMn3JUdaV7
	 sOA36Y7AXO/a/itFKai9FSh+rYuG2QcmbKJWr4kBUUs/d/A9LaNwzzrXEPiEgJgnEpGb9
	 mSxOBpCVnBlj3uadE8WuD3G7P+7VvL4fXbkK7yO7XjyLhepEjOpe4obTeebJAKmLWZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rdZi/ijW";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC5606A332
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FC5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdZi/ijW
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so48109665e9.2
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864412; x=1795469212; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=rdZi/ijWZj5oxk+7P62uQU2Ys7UFLJor5x5ZL1WN/pLDZphzZkj7qiX/LuZP4Ajb5Y
         sqP6R0/eB8axHNIymH+FYNCbD9JJljgaYlvQuE+YnBrnmJE3YlDdaJGUD2jJ1WrJhf80
         NLFtW7y4ufwphEXv9BB6pKNsRc1LiKvm4DrV8PfEb5aFZYw8fqdQnpqTkniRPFa5KHI4
         jcJvbJu2DQGhAHgPLIFmAfnbGjpsHu5/J9jt0F7EkWhFO4waksF87bAr/NmDXSPZKu3f
         cTzALTZHY4nWSnQUXBpu6uT+BrjsM0CYgtFPSG3KaJdH2/+v/8YYVYZVuq3xCvkSHmcw
         8r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864412; x=1795469212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=tG1FooUpfMaPJ04Rf4UDh2dWEHkdU+UX6wY0AYW4CJpZa/isZtnziOwSgAyZJKmEVU
         Yj6GUDylCtyo6OPzxqb066hxeD3YZIZ/0UCm03JiHaKKMtgQ9MT9Tij5bwGarsx9mcfU
         ITbc9u39BPwBS7dFEyRewz/XmxElesRPJx19bNjvJfRhsrqjoqgxxr0CJFRrt0hyAjQb
         jlGCMtBKVLvFG7pqJdmfnemvkPI/Go4YYFJXrdOn/d62ZG57zGvjP8z6fsPtH+pGXlng
         /oNxRDXgH40BwCy7rzr8lFrzutzNL5rXFdFHPIOWUuzPoLMDMuEY27cCFCo4nzjniweE
         COKg==
X-Forwarded-Encrypted: i=1; AL+hErEza76JgOzbuBm9lns264rP0noiBoijnS7qPl3baEE7kfaWiYJsANkNhhIPdI8LmE5DKrg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+JVr3NVeLjUsICpeHvTNrPlpjFGO3UFGJ6xyWo2l7iuoeTBWzs
	6yxRl9stUkISyHGEjfEcY5flpcK1/b0sxZrIIXwAucjlzmVXm+Ayots0
X-Gm-Gg: AYBFou2zaUTxfzKPmcY4msEKWnkvlWObQ6ci6nUZrk3HDKwSBpvAggSnXJEaDIbnhiE
	GN7HPxCCqKwXxiOc03fLUNQvFBOyE+UZAwMsBpzTnQW/VnZOtiKutQF3cV/y8/PgJiXIju5+KVM
	3ngVLrHgFcxumooCggOytXLWq0dC3wYG0Z+p2qMVHwh4xHvEnBagsV7OA59L9kF2OtjYQiJFQ+G
	Vlk3tdVPHeHvbnLaaWBQfwRe+Yhg0p1QuNSge1g/dmxuh5Ls/GdUb2h4XWbQprTCQUzlYCt/h0M
	URJCBvpN7uPqUCBbQwag4SA4arzZ/h40D0R+OAqVZhvKQjdKRCi2moJITNkzcHwRDkzIq7Ib4EY
	TpBYXPj6j0st5kIQLl882zc1CMOOU9vUS6gspLTYOzVSJJApY+zTzEgt5UK9Dinkhkw5QquFeUY
	ebtcxWwyjNZe3cNwTJy8a7YfhyU3VstYxZQrQt7FzWFYRT/cKUZwJlONbUJmZZs/L9x+Audgm44
	qlDuh2s7AGOmUAuxhlcYSTFPNuONtxbc3nVomNQfOCc6cytAnIG+hYJVt8SwBCI+UcaGdpiJ62W
	IUSSJxm81CU21URagZAAxhPekBoQbnRto3iE1bbO
X-Received: by 2002:a05:600c:3d92:b0:4ba:e7:ef3d with SMTP id 5b1f17b1804b1-4bb559f7044mr243891145e9.1.1794864412296;
        Mon, 16 Nov 2026 13:26:52 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:51 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:19 +0000
Subject: [PATCH v2 03/16] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
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
Message-Id: <20261116-halliday-dts-v2-3-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=FqcgSljUbrxAce/Wb8/tWQg7D8BxyY05VfRoM3lIlKWOtWcZxkvJ+EYJdvTvvxol8FPPRApKu
 mw5+dUw4O8RDXBA5aD2L3Fg9fYj7OF5FtJNOsGNYBuFx4Z8h2/2ns31
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0

