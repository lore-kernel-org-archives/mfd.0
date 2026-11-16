Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864406;
	b=3rEfbhLebJ1cx/AJCS9Vt/oS5ArUN8cRg3R93JrxboIa6d0KwkR4IiR0yWj9nWBQMiwb
	 Y4agvxsMb4qmhBLcgiiAFs8kq2ReCLmTfTHcBENFOPfHLv09fNXJfY4bnAR6BIFJ0+D8H
	 nCFqI8OA2vH33OGKZ+xmSIB5PEDrkf7vh+ofwYamSjB9BtLxoYreh0akWyT9HpaSE8Qff
	 B37MwEOjOhAFCrLoiAqjROwf6pEaJsnNLPIy6D/H78+FLcA5BZ99egpz2a/+3fXV2BpCo
	 QV04nhiD55onYl7T1TR2JzGtOlDVw1OXOIJTHSuaCZUS1ctjlid9Sp5LSgeVddLmfdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
	b=tjJZ2Ep1y93041UKWkMAndV5wmLLJXQAJuwXj6smQrnXhPvMUJitlsHJHCt/h8vk1uZT
	 yhkldT72qPxGERESJhmC7JXyS3CFDaSZhdrCr0crLtD65VW1k4sWue678G5fkTrWYyaMo
	 +nf5a3K1Dayba6yMaJPozle1CcIOAGcYfLonZIstWv8caQDYVN5F/H5499GooAMyBD4en
	 F/y8SDDpeb5XvKO8IJvnwV0jKc0TzYKWpUiRlFz3RWjSKsRL7yfFvG/0Juk2S+VGfkkZC
	 FazZk8h7P2upnVkMc/jBA6hdLEBXf87t5E1fxf0LJ3WdG+mpCqYF+NRavvPsNPLEaiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqFDzIyq;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE50B606A334
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE50B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqFDzIyq
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso23345055e9.1
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864404; x=1795469204; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=pqFDzIyqC322DA8EfHec6aOa/VOOYNl4arX1He5an+K1WGwruV7COpQrGERPR08VjJ
         0qIItPLb1dmJw4MlbWMiqquV+jG1n02j0+yWx4YS/4PSbOf3MdvJtMJ1r+o0qRrx/yAA
         aB4piKbTFo3AtCinDYzfoKJejKBneE/NjHRgAIBBBc31qaFHpWlQ9WHzo8doPFcSN/MO
         dmsQm9XfpUU27SX/eg4+SDDi5sExA1VDoDdKnvV37eMb4AvxfXyYFVrvAJgSTJ3NrooB
         5OddPg6OY6jTgf5C1lVFsUqVD+x3zjN3l13yY8mqyQXqizI/Q/Rxaog7T61Bw1Vm3KFJ
         ZooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864404; x=1795469204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=pvErz2Zsjt5TK63Px/tD32b6a04SSlWAumG+WHZo/0WLZnpvSuJyZBNF8Tkj8Zs2N9
         FXlhHEJ2gXNHQnXq3iiUTOCi3ovs1E2ztaSgxFBvX9Aa78dwjxjkkBPiSry+ZJSu70Ax
         wNcsV1Xlxu08C71coLfSEToJ0W8YQrNE9yHWEZa9kTRA7f4pCP948I2WXI+7fvEWyr9O
         lulnN5nPjOeSCJc/j2JdV+Kj3WGJhDlPMzxgTOiS6kbekRq0ER6aBFRsNnfv8Rd+l4aI
         G88iapTGAFFJ7MMl64yipwgHlPid+fCX1pwEWRihgepkuwYYLjOY7+6qzSs/CtJvmG0t
         Rkpg==
X-Forwarded-Encrypted: i=1; AL+hErGAz4I7jmXqw7MPo88cHLPm2wE8CXrf1Z7rd0DiAGbHNtThj9WaW+19YcG1TQDKLP+fA60=@lists.linux.dev
X-Gm-Message-State: APuU4Z8msgVKXq74p/8AfLkf1/FwZrLq1zG6ypbKHy8AD48QvVqqEtiy
	//VaX71AtdL+PGZeFt7QS0Jj2Ood/79ZJt36aEtzeTGklQy04IxKIv9C
X-Gm-Gg: AYBFou0G+NfrjIDQWTCjz7mMm5Ztjv6W2TR4HM2cR/qqIRgAnRN1UcfVQu2ZNcC0k9g
	eWsOG/Dzc62N2pvrglCnfyHBrK4Rn+0Ek1+k7B+ImXfHZgb6ym1kSiw4kyTmoeBRf2bPAhZqGhi
	btD/1h+UagdFV3WOhy2Fx/mgdV7GMRpewJr2gbPSu58wjdrYsxwBTvbB+Yw7TAp28xxVe4PUuHL
	27G3+05D7+HJlowT3h8Xqd9LLHY3YF2Pkq5L+85PN3M4I0a+SdCcWBegVoGH8n2WcyvgqMBNtIX
	YW/X/YpP+2fORulO4VIozq7N+woSxMFWWYx0UDZ0PcAzWvinrIOVlofI+ZGjEZS5JMgHCzq0/8p
	h0v1SWStqE4fGDtdS5/odtM3gsAuVd3yvPZjUNkMCw9JaGfGGxEjs0r0ta0nbNewLpgVlfexs4K
	aFmJJzEdsgqq+1S0bjMQR1HwsrYT1NZvMsQSYjK1D3+sDEX3tvlZn2OK/faiarFrDFoq9DDzSPz
	g222b4WK1DrBr9rpps4Wu9HNpoDusvaZKkIZLSIgNkNt1BW5+KPkGgfANyTCDrE2pohXasiBYM9
	1dz5XR/VJKctxsJVBIBY4AvcOIEzuTHreZXYq0WG
X-Received: by 2002:a05:600c:6994:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb647ddc1bmr178719475e9.3.1794864404416;
        Mon, 16 Nov 2026 13:26:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:18 +0000
Subject: [PATCH v2 02/16] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
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
Message-Id: <20261116-halliday-dts-v2-2-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1076;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=2tteAd38AfHrvk8Awl3RAniXNSdGBzL0LwEwE8e7LoI=;
 b=zXzEFbpmrw7cpK4pILHkAa2JAONx4e/NBSRGU4M7PF0mG2S7il3dQ8oQ1GaRjzlC45Rh8Rzj2
 +R95I7vK6fnC+0EXJojPOiNt/4zRdqb4EXf75+xmDMH2zxxqkWubFgC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8ee1c25a7c9d..663baae9cc64 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - qcom,maili-rpmhpd
           - const: qcom,hawi-rpmhpd
+      - items:
+          - enum:
+              - qcom,halliday-rpmhpd
+          - const: qcom,sm8450-rpmhpd
 
   '#power-domain-cells':
     const: 1

-- 
2.55.0

