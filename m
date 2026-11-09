Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184436;
	b=H971Cvt41XacVVs2IDwljMR3Cs0hQhL0X3e37LyjA0LIfBeSux1lC7F2Rc1v3tt/cKQa
	 Y65ue3eva4m5oJvTriUmOiGnpNPE07pnxozQebUnsDrOOGGqnRfujw9msRp/eET69GV+6
	 ZYMKtshG4Z1yAXIQlnLfApoj6lHBUdCkqugpbRmu2xqtDyURAYTqESc/UUFysx8JfvLxb
	 ZN3CjJZRrVq3bD3vT4JaWP1B3+t5p0uvoSSgs8MquO9qfjXUJ/mnhBAKq11g8I8Txns2k
	 xZprAEBe5oP14DXQ8TvmS8eC4YdEaX42PNKOw4It8tJMNLeI1954PhXa35zVlRx4hsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
	b=vpeCaua3mvwA33Qww03CD/lYRaw0BzA6knvnmnYctfzvB2SkgGcve6AocBk4wEhpLdg1
	 1zZZX27jFLZ8Av4s924HsLjlXRMb+bofr6IQnBTpE1nI+OElYxlgdD1HNSrr/qZyhSAEs
	 7WQBga8L1iYq6xzN6cNDawUqevcO536d46BPmMYCY5Mwk0dUaMdKSQXpkig/kLk361Nk4
	 fyP2gCOflyIdATQDR0lcOL34BDEo4KoNOYTu0GwTj5zuTRHWxA1qykFxjEeb8fdHdoarP
	 w5fSSWZjOFEQMHA4j0rqIQzo1Y+02SA8Vzhjru36d8LmxQixLGClvYaRerG57pMeOzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOV+fypm;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BB9606D80F
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1BB9606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOV+fypm
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490a0e72588so164363f8f.3
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184434; x=1794789234; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=MOV+fypmfBKMWD/VeE5CNHPneO0GNvTI7rIK3/gHLm3LHUQ/CJ46nz1OWTMBsBeXrk
         RmXRS1fMvNzMowtUkq6xofUigDzxzzt5EAvqfbFzrkbK0B+6RnKdb06mLI18Xqsxmd+B
         CsuDYhIJjQ4ngMyLPQy6h5Edhf9GsY62nVGFUx9y3VpEepROwMnf2qXRiE4sbtVgAajw
         mdsXl9QWNYVhB1J6752wylVvBTr1o/Gmz+ayUJihaUultfEPnNDF6Tniwek63Hq76GKi
         qeLh2R9xmBUDAOqRBILjn7VYuY1eA4JIf99CIEOi7Q9J2I+DwpxDQwlhrR9rrYvTPuZP
         VFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184434; x=1794789234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=qsI17eq8T9/E9U3E840QMLsvVf6UwIcdXkbm21Uv8+lIyB9mC+EZm3C6aOxjARcfye
         HqHmn7uOcVL0x77gUNxenbdQ8eG7OWxEWajmsGMR+jNHa6v7W/CxaKKZkblOGzbJbcfX
         WoS1oNBDQaHkyS2YPdJh40rjbzomp6/eaCw+cqs2bppPq1AgiTISA0ZNgVsH2uD5FLex
         8dRqj3AMJKqiZgH09fbGOrhwC1mZ6Vt8w7t103AZ/gahsYogAB/cioyVdJsr9dzgq/4H
         YtSG1MDpwfyz8rwuPFxv2s60svS+ZbIBiHpTRhh7m1kgg1aDW90crWSy1by5jigNUquK
         yP0g==
X-Forwarded-Encrypted: i=1; AL+hErEEnaZ5NX05oQDvzpKTGySE0TENHMCKbS3FklqZ3D8qJRt1ApJx3jCDWfBX/OOY3vWx5ZU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/aLkWL8e3VrLDtZpTVSgXI6HSoUSnf9Qx1LzRn0un5byJm1BMy
	z0QcMWjTLMMTW2TTGE6ugJ41p0S8iIWBLeKLffDt+a5b4mcSKZ+EXTxD
X-Gm-Gg: AYBFou3jESNXZFJatQ7eX7uW+Sgb7YvRiN2rBgVYLGI1DIJtnzgPHGFdbKGdBXHq29z
	c6CDSefArMkZK0t3EpR+LI5/cEwNwEVodxuMaA98SENgzr7n6XlByrrxr2rzFIPxCdAg/YTY78U
	WaBrdUMxEvtJc8JQjNIdVSCt/nqnhJS3xslNuIjhE0Jmc82Pgpx8fX/bCOA5As8QnGNsV7qYl9a
	bBhSb0bvk9Klldr311fL7lS+lvMnEKIIrXDBnPKhiul5l4rXJJ/62M++vGsq5uNPOa5dfqu+MSY
	U+skf/hCS4S+Jw3F39qU7H1ySev6cKqa6yjFipYdYKAzTtjT/i/X1p1T6MKk3wDaA5DfLyuUtml
	YsUMDhbgzMYFJRfnYOs9Ujd3Mmpp78f5UeEZezvmCcuEE1yRvR5L1z+f+UTUyd87G+GnJpXdLWi
	x4bWjgmJc/HUkb7lue8T6AtX6NTkPrwKbveldt74P+R0ksYIYni8epPrOj7WE694+GNQ0QqC3+8
	z/w1RKLHqDxYjyiGufcc5iaud/jSdZJtVtAcie5UHrU8ArSd83c2u55S2c6mvKYR/ZsXVFFe+uy
	vwBMac6/WvAa0LnArVSiAKbsp0dIJMkcyh8CalRhXg==
X-Received: by 2002:a05:6000:186c:b0:493:2eb8:e7fb with SMTP id ffacd0b85a97d-495856e15f7mr5379354f8f.41.1794184434351;
        Sun, 08 Nov 2026 16:33:54 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:53 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:18 +0000
Subject: [PATCH 06/17] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261109-halliday-dts-v1-6-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1112;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ePrzoruUVeLDRq3OCS+DiCl1d/Uk3kZuK6w1BATsFKY=;
 b=pH81WehGSEFzi7T7LS+ShwXYAfu5lsev7imaA1JaeNifItRSFvMkK3a/y3Fr2K8IwuXgQfeAv
 1F1xnpR5tNxDdiiDmSxt0TVIqWh9HxtwfbMTz8uhxpsozlK3LlCAs7D
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

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

