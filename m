Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864477;
	b=izXhCZuYJNSjFvU4PJIglwkpUy+fZgEWDzbBrJ8MUgLveKLG+OMvcfJyJI91ZyBEeJdK
	 DH5TNOw32SOXw5SLE7QkvRFp5dAC95JVfTIVpbX9JX7CI0DPik5/CRTGT6yZ69GIt6Fe2
	 ZBRV0iPms70SxFv65/9+2bykBgt6X/3Ihf+hccizjQqvT4oyBXuDKCMeija0YvxI8GmPU
	 YuD3emylIc/Vuzp+XGBok00JGLlyQ9yXixMwC5LZPy4RzNvuHcWLTad3vj3SXTyCUsPaS
	 6LQmdi7INClQ4V+RPdEYWY2B8NfOtUnAVxLNXBYFtUVpN3p+YMImyj2Cq+QJNAg8tbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
	b=aoi4chuXzs5yi0QLoNS3fhewjAm7o9vWyQHxBz5TQ9wsuRFR3UzZla6jo/8pdD+q7ADH
	 EjIhFZshPj3Y6USbpsGfatKJDhnMpMeuru6ubOVSHlv58zHpwAY6fWDWWH61SVu2i3voR
	 EuRSVFDGCoaBxXevL0hFCkiR6cSCM2QanpHCnWXItJ/jq1H8QeI19IThLp3F9+/jkkDMi
	 GepRqWsL2m18SQjFA/weE+zMsq66bk5ZJ8QlwRdLr8jDpFMdbRDA6aUt9TRj7mRrsrtk3
	 +qKOIdB1lPEvSxgDT6V02CqfKP5sTKwRxp6lxWsA7IQvRGTBqD2aRSLRBOrdsUhcFqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVBnGoPZ;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3676E606A32A
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3676E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVBnGoPZ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3edaso194002f8f.1
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864476; x=1795469276; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=LVBnGoPZAsugVavAq5B6o3YahdoHXtl3auI9jRdvbDNv2Y7PM7WxyYRrYUmQpU2WK/
         mlWEAeO7189vcyy8kP76r/9UHjhihlInrrom6/xFGuK35M7QpckcQmcAlWuyy7e0gi4f
         sSgn49MqbTgn+axkrOb2EXlhJAFpHQM4+fZkBILkooldKXBtFbPZUz/2L/mGf6ipjKDk
         iThY9sY/IFX/NImft9OVh2sEoLry2rkxHldQ18bIkTRI59FbfRYOClpXcW2PnTzRyDXS
         SlmFFx9HtWaHSznd5oo3SI9FwU1zEFtYTdk0L9jAkuaf/x46JtBsuutLPtcAcWnIiPK8
         zRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864476; x=1795469276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=yzVyMKBPPMGespbpLidGO7ORfiXDkcGlQUP94fUZ71lPFyFFlXQehCHC+yKy43QL8Y
         GI3QyUMf7ITbHIAE7PtTCmg1rb+sFLR7bUelqtUKKYUMpSxPcHo4BFOXc1/dZvw/CvNH
         qscCU7E3AITKABgDAC+LeQ8GI5VYcSufQiVxfUTYQg/QHGJBk0pdV3+L53uosk7yz3nv
         wsPTao51UWH/U86d9x+u3nFf0rzhfRZ9aVt+v9eQvOm5SbnuUpC4oDlHlqX4rlhALB/B
         K5H/ahRZ5kC9ZBSiEi18+OO9bEH3eWbJcNkvmH5doHZfAYxXBrHC+2+rNiPHtS33eBpa
         UN0A==
X-Forwarded-Encrypted: i=1; AL+hErE4niVeubXyjMjYKzASVjD7M0IoeMRdlWyqgmDFs87xN7Fm4XB2eGCTn+AaiFTj/VsAntc=@lists.linux.dev
X-Gm-Message-State: APuU4Z915eR6IH5rw3AiweQIybEg3mHIAuh0cJtrTjcvvEOvCS6CfZux
	P2fNK7I449m5hO2QgEeztcYhDRy7/nNYavyy+7WGjZ0nOq2jYXcySBJN
X-Gm-Gg: AZFdTZcSCtJ8xtoClTuv4qToFWewIc81retDZnzzkZi8XOdxIoDSzWFPBWFpT3/ZFq/
	n5eN2DogdUPkKc81LL7n8p+I1uv17XFyoBhaFOWavnGqRM9Z8lsgXVDaVnoOV/xaDWoX/bj0qxh
	IPVe4iCXfBFNNByonJxim/dRz0WDsxjDnxtIlO2PLr48W7FOlWhQ/NbYWevs2WELt5Gc2PTE+KD
	8ZOLi9oVAc1v4+0JUgR+JI9Be2ZxN8dIxQzJNSF2hDXt8dsHj8zGV2MbPIpTQcwDSoF2KyCswl/
	+cChQo1mGwOyRRaLxOeHxswYvy/xFXq7TQY7KMXSGU/rH1+RYFhEi9sPc8vHmAFlLQLawqZOhxx
	UcpyhPaZA8ycv30AiaBpYd0l8SUw0lQX/mtHkjV7vBE70g0KxPS6q1zp2uYjA8SUL5zHYM6brQE
	epkfoztlx5WWlLorRA+YFyF305CtXoIstmXc/x/c9Y92yh+vo4+2BWWl7oC2gsjFBow3JUaG0Y6
	UeQIwvZu96UYuouSVmCJjpVXgpzfzIjD6JqtTuBXDeb0eQeTCN1SqJT4pgtPyw9g5g5zBPeIAf3
	zgvrWURD6eo6kdkksmHMnsWa9gpRVt5f7mpc1LxH8Utz1ONxe+xgTOBGFumznQ==
X-Received: by 2002:a05:6000:4706:b0:49d:8ce1:2652 with SMTP id ffacd0b85a97d-4a36bd51c5dmr1648244f8f.1.1794864475624;
        Mon, 16 Nov 2026 13:27:55 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:54 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:29 +0000
Subject: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for
 SXR2250P
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
Message-Id: <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=746;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wp4yEFlEeRirWebvDUNwJG87yvgwIo0fuTVgUjPIFVg=;
 b=c3M0oozAyWICul1zqZyYV4A722e/xl51QI136kZKSBBz/N4l9sptO65yuOtgNCZsSpOrbqAMq
 sRMLJj/ahy6AipZ7ofcwU1aakgIIwxaL8YroDdkKta3ZC/C45UuYvvM
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 135297027580..cbcab632e01c 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0

