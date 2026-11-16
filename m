Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864446;
	b=Hz0uHWn/2kqqKfGV+t32UesxjU8HxD/yWZSuicsDoIEc4oYPYZ/bDkEtatg34yvwV2Tx
	 vev7TPxdXrA4mQz3xRcRaJUGd2iLV+kPdccpB2lX1VDrHejigdU6lQZL3G2kvIWsmzLOX
	 9xSTbvhbcv8SJhY7zO5KaCFpnxcEYSloSMOzlj0XnRaDywDWVyN5yOW1R2rw2k5L/nExA
	 spHFhL+rujly3s1VfvR+RnDgwRoTzekpcq9kbLF5xsc/nvv/2DIPFctKLTvzVZjuX9x1B
	 sO2KZ/CI/Mde+1efCTtZkWcPnlCXGL25CqQ3ys6TdC1EYs+HN0JXNlpbxbk2cgbPKIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
	b=GO+jQq9dta6eTMtBnpRnWeXxhGqztB4TxuB7r5YXIHvgazECwicQy5wq1I8cZdIJtL42
	 q0yBL7DIXm7YH9QQKdXWZXdOZ5PcGN3+RxJ1DqNpuVUrANfBzHzLYnYyp7dWLdRJYisQt
	 Hv0e0Tnl6LjKFkE5+UwR+XXLyFFcjuikSsnZf4iDspEdgkmFYiyr6t50SOa89foP7SNlH
	 8Rstn8MdYp5b7WhDy07Twdde4+ftr9GJuu03K4GPXQCl0JnnCYDG9+inph/rBNtLfT0yB
	 orkr7gjn52pMfAkU4HnBqmlgiKJfWQDbsJPCT+2h3XnguyEqwhrZ+H451Gj2jLX1NYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6KrdGi8;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F6606A33F
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 724F6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6KrdGi8
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso21062245e9.0
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864445; x=1795469245; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=R6KrdGi80Kb6dXMJdOBfRaraUWeg1U1shJb50WH2i6pSZ19NPritvkOjAJ7SMop+uD
         wkj2e01lgA5d5fGgsr2v9oDUkyKyHPsYvUxfLltqvU0aIf8QEwzbw8HwEbNi4MKxwJAa
         D/NcUucsVYxWekFbgW0BCQ4ovqu6gwi0d2d/FJBYBiCQZQL78FX8yjIRPURSy9E+t0Ku
         cxK43e4cofu1OM5gXGUpDRqw1BUw89iIEzm9wfTgOQQvMQfDS9SOah3weLL6EOaziNIQ
         vw3P2nxSzMY1MIifuxdQmAiRGVc3MKfOt8X/LgFB7tix2epBSpZxX6FtPtgywn63cIVS
         2PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864445; x=1795469245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=N2bjJEQBk9etOG1h2vIhqFz6gWW465cbrbwtu4uNep76PxugcANwdOtdSTM+zSFzhP
         BMHRY8SLewWOUuDMvU5he6c9lAWkk28zEIUHkaD/12lixY0RMudHHXJVIksF3QT74uaD
         9LW70P1p8Q3/zB/pk+tzhsXeh88abIIrn3PGPKq7Ayu0Sx85o8T8Ti3HOR6YTF+OZI1d
         GeZc2M+Ex6y0aNCvJbhRrJkzdkJFuy0l/4mhlDSMpkoY067DrhmhKC5FLNhDpImqySd+
         zsRVA0yiyrruoU9py0xqa1eYAbYrUFgJojWMpjtBAIgv0J4VB21cQxQyKSIpFvpC/dsn
         +5Cg==
X-Forwarded-Encrypted: i=1; AL+hErG/dVSdl4wZJX6PoyiWnFMLpeeyPspA1R7pUP18yHn5a+RPsPvNzhcJlUL/Ad4o/U1pUbs=@lists.linux.dev
X-Gm-Message-State: APuU4Z8EK0yh7zz+bAq44hGRzSRo5pmi5EzeVrxiENy3MM1u88WxHy0U
	Gbq/Syy1hTlRZNuJCvH5RDO+Aj3KGaJCgSfbMJgV4FDhvN90TR6Qovxx
X-Gm-Gg: AYBFou0ttVA4hfgEMUiS50A2YQh0Q9XoHrHD43mi4WWSR6zrEjt6t6cnxypk+w1kjjM
	ZyseRpBfi3xU8ARSY1CVrtAMp91NwYtyrqLCdaAcq3tFGz8hOV/UnJl2Zd0TyXoXoUGqgnT+hye
	Ea0J7nNPN2I+uSEHwfqfk+e8Xdz9NDiWPc2XuZYo0LzW0YEmRrXSM7B2s3szm1rutTsCDsuN9z2
	4uA3QO4PvQLWpgCyPW2hHsN7C8Sot6hfuG6ToYtsWwlvkuj9qIrYeKohTdhKxG5x/ZyvmrYsoSj
	4CqZ/6wU+PGXwz6igF9mXMV7bBqRhQgxTf1jmEzLGef0RhcYJoRG8CZwk+Y1J3NLyz6QC9O10O7
	7gJCdNsKA2jbjogdRvTZrQZm0e1RXbqpdR+92wvPKAznWgLa2ReLqasfcAyas42ixsUIuB0cjvu
	CLpbcV8qnA9/o+z6ng8nqCDgbK0NuQCZN1eqhw+jf2R0RSkxlDG/gHzTi/QVposqv6uvwK0WvH2
	faXde46r6dGnYnp7WleZQYV2two96kWn+cFh7R+BLHwjLZcCjYPHVFErac/bMVBbBofn06unwp6
	mAWDSvqh5H/uH6z0TDwbCX9CswT8SnEmMsl0tM1h
X-Received: by 2002:a05:600c:6548:b0:4b0:c1ae:829 with SMTP id 5b1f17b1804b1-4bb55a8d621mr184234605e9.30.1794864444941;
        Mon, 16 Nov 2026 13:27:24 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:24 +0000
Subject: [PATCH v2 08/16] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
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
Message-Id: <20261116-halliday-dts-v2-8-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1028;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=e5+pG0dDXEqC2bp77Ez+oDydvwUzWtL2BPwcLeGQJvE=;
 b=gD8xOm5xZ9FtfmXv7b9AItlwRATNEZobnHQBfav0fJLpw18USQbXaJrBNVYJ8htSmcNjmMoiY
 oIwuZK62UjeA39gKapnqrq7NNerfrM+Hz5ecpQBWUPf7UaNqv3Q7sGR
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the UFS host controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0

