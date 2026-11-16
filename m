Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864421;
	b=CHApKElEh3Y6S/5LzSQVnO+0y33ybmbZ3iDvnN34IOFjVy25AcAJnxuyvBUkC+zj1jMa
	 uFGNusO0Fr0VeIq/2MC4j4fssMyaXq3pI0PbEodpX+uidHuJXY1znBqkCenYx1zV1C8PG
	 YBEjCihaRsZ1dvAjYdqfVJ+RYeIJ4qb/KjsFOfALAcWHLjwcGRI/6atA2Wa5aJ2+OF4dR
	 xX7nm4aelAs5ILDeckGWfNp7rmrjFICT5TeqCb2fm1NRNaX5vv8InoJILDS/Su6MdQdfu
	 J3tPYGE1lT0D9hAGt2QtyKRDiSYdXeMZyfGiYv/OOFGtDW0QDaZKyDBco/Xi6tyGRcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
	b=CNrSmiGRlC9tONyIyoCn50zSsGJmtQQtrRbd56P1gBAnR0yjxoHtA3iIYewcpqsKjfDI
	 EFOAWfPZlghh2BiCqGqMv34JaInrGm5Gb7AXo9Wg9e1DT14cFb7yb33giraIjdnl5qB78
	 nTzGd9hL1gGUqA4uBP14iGFlUpbjUqZT1yhc7N1/Lzludkbb5egQtFbGFrHxrnJJffTi7
	 KoQIjgVg3qsHkLVqp9WcVIMeO5SqZgTbkrlZKR7x8oB4t6GUDdg2sBjinGO2J/NSQr4bK
	 ju//h7CXs2lhb+R5gjpZMOEYLBZt3JmVcy2qnA0v/AD8RlThs4ieVEmXE9o35nVG7TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2xy9Ocv;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE205606A331
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE205606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2xy9Ocv
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso45094745e9.1
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864419; x=1795469219; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=Q2xy9OcvY28vTR7lTkKqthZOT/12FvBEHW4eejMuo9ckP3wMDXglm9yqQNfGCqVHXY
         krrqd7XprD3YJMGOKSM5/8VNRgcU2nG/RlcH0L0kS7Ycgo9m8v47YIeYe2PNcXocY7w4
         TbWcTt2D2XVskTLxQCR6NbhjGzgEfQAoEEVnaQlkv9RkttkNuVHuqhAI+mNP0lwgP9m9
         lO6OxUCH8nHV221+PA0ovHyW/GnMpXQbbWrRDeHhYRIWt1ojXVdJZ61kKnCFhYZWk6V6
         JJM/O4yX/XQ3dohflC6T4oabdyYQqiXHS4+auPtniIYXevsKw1vEEUAZCHz+Ur99q3SP
         TS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864419; x=1795469219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=iEazYgECuB0QnJsK4V874OuJlYj/7S4z4C0bIC22uRNzuxOfeCWVgJvcD0bTUDT/iU
         O9nGhuquYKSlC68g2RK/e7MwFX+GWGwXaq8qX4TaxqXnkh6CpMSiVn19G2NJiykjAjKF
         fVLsrm8PKRg0k1SK1hxDxcJGElbUbTaPtnylahW4SO0z5lNMmxbHaPO8A2Fs5fhxc36+
         ewrzmAYb6unQMo/3yJf1fFgI+20HhR/sU7Vq4+pgXLt/ozZVb3Y0Vo9vz9GPAegZMjbw
         bGuY8PWgcQ0DLkfTxCPFZhnDNbo39FryAqf0eKicqH4GgU0KAdtW9pdQ18kMYIdnh+kh
         iqWg==
X-Forwarded-Encrypted: i=1; AL+hErF3MYDMSKIE1rg3o9tbw7vlEwwVLy0yOlvAhc5oaIF1IeAxLthEkmqjTIVsUXxkUIsnltY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Mh2icsJDhhboljABjGD9ax/kCR/w33+p4O4sa5Ah9qjd+rYq0
	oBklQbZNfsqx0zlPFgcg8vvGSi02JK9CRc2rWC4Ajc7nPBC+up7BsLFV
X-Gm-Gg: AYBFou2uGYsxCpTAhade66tjoPCl4lqHY6X+iiKmhD3K2prsVvfewCDs0gD4f8ZSTqb
	+LnHzPWFXRNy8aCChJ48gihdjTnq1kNKYKiwQGZrxnyis19EQhSVb/4fyOiuNilJSe+EywuXpvb
	XT28b9HerR7SDo0oylruCCpDJ8Jycmb+Z/Ovlciavb3YLCHQkKasKBeQ/Ekk7cUnnkTnkNU/vT2
	/n9ynF9cxYyi//QMmfTJ1KBd/9Mi3UcC1acfLMPTMRUMnW6ExVMvquuFmfq7IyFF3iPLimL4sUz
	w2DxSCddocESrfOHjWX5+v7etEaD3MOk2QtRitcSgkibZG1NOqLFSKPkvVcHBhX1vofg2IV99Mi
	4T19isrWnl+1QBR6eVeifqTJV7jzotca6jzNmaWUoyaVREEEiqG39sjmeuvUU2QSII/bTrvwsUM
	hF+tpd5IsdiuMsnnglLCt/Y4N9HjtthkMZT9D9pg1B9gLAw5rvFK4nALU19ch+93IgAzJb0YvQX
	JZgw4TBEbRoa2ngoxni4PZtyF4mVg3AZYvijYTIQBABU4aqL1bv00e+OqAZgxuPpBumglBgbv0j
	3G5zx7rHF8nS6IfmSzkvleoxcXlkKrCiaVlMS18A
X-Received: by 2002:a05:600c:482:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb55a59c9dmr184592375e9.22.1794864419406;
        Mon, 16 Nov 2026 13:26:59 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:57 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:20 +0000
Subject: [PATCH v2 04/16] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261116-halliday-dts-v2-4-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1185;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=48k8tRM2Ds8B2KdX/k6MNHyKgJdAqOSEc8lLmnEqak0=;
 b=jdhSJvOgnkWCr3N/XewHYvU/DMh7fs9E9l4PMB3CyD3bi1r+fHKz+jcOeuCkYmmgxW1wl/a9T
 LhE9PjP/kP5CRKJpxWsTiZqjVGzsx7uCz1lP4rAnXmBZayBQqDt+vzF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0

