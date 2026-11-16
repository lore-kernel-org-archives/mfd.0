Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864400;
	b=xvYtMx17APERlX/2DP+zPkJoAjWc20WsZelKHarHsnhHgjE8+eq8Pl6M+ikX9qi6SI2F
	 QWVbKzEiIjNz/g/DDuzJU8ICKnOgMRh9ZpAQ3NkURQF7nupgIK+5e8qKyOLhjFk3nHC9Q
	 u0MWs1dFJO4NMt6UqYu6dfNO4CMY/C9dQK3+uQZZCDyzJllMdKULIXZTGB6SCZymKflqf
	 2I9yxRltJ0a+l0GwttfqA2IcsHMJLCR472OI8HY3L2hlkE4gDxmydGiL5HFc/Bx6aIDaQ
	 BfsQKFeAAs7JhFUNtIYTXlbBCR5HjJsfqgaZDEGxS055FO+jROt2PthWP6RLzsiHKLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
	b=exZULcK21rBzafHnOmFDXy4US0bOIQAxKiS44jnvay/QjmRnnVSRc5pT9d2TQdsZYjN9
	 BLod9kNTH00WaNHa33ReE0m+DoSfkDjAXZh7+NV4wr2opjnNC1o9kyxHD9JjFxubeOS69
	 63xkyoAAi4bR7i3nR89tVR6Ik/72X7cwUkE78VOvmxpRj/ftRuMRyyw9GplyUSGIyy7Fc
	 TR6IDHk2yQQ9RIW2POguJwiI2gFIn6xMlAtPadc7Jp1L/qBBcyfSzmHfw7dQ3wfoGexhe
	 oYqEhFrujTjNMFR5fmfhiPSVtjbOfAQYSvTMF7YOyShGbfE/cKF43GjO/bZ+AftHRIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwAS9Utx;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB67606A335
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CB67606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwAS9Utx
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso27226425e9.3
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864399; x=1795469199; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=LwAS9Utxr1JAjy9FVtB99u2prOHGcT6/jW1if9eH5xMDyYRk3FOe/yMNPzvp4793n7
         ve+ZcFFCuzcis42chcju/A50hHU4/x1JsgWWAumKh7LlABY5hZZH95Ov7WgCg5sa7QGu
         1HIu9dvy9CpX+t9hMj84Fy+/00jWXgwnDoSLHYGKpOoqqonPobxqqfTv5YJm5rkpVL2o
         1Nh87uNGF+0h/w+gH0gI5o2kQ3f0YBJXI8ruFIjv5h9dYaOnwuE6QmbES14c50llBbAP
         i9vAF9r4KdNbhhzlGJNVApE9dn7yBsVm+kbp5boUCYBgJB/FojkfeXNeM4n9/dRPQki7
         D0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864399; x=1795469199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=L9Y/Ujpe0ZyzFO+RmEmrVYTUoOOFc0MHJM9UtetqCmGbbGTBp5v3PRhY7GyS7fB/3r
         BFQm/txVUoQPCpfbMGEXdYTCZqQ0b0NGZDP9odx0bhDzn2prvh2YE1iZeL0MeeC+qm6s
         AGZKEfAH4b84Bvpi/eLjVRqxI8I5ktwqynSNsUKqP50jlftvjnuyE5NvHc2kaKDn1CWU
         xTBzSR5tshgSs5mrhM/9LAvodWg9CUWuVrzBUU7RFqMlTTndsKbL6aEiDi5y2DolT4Lb
         CSlOJcqlixPefQXb+m0JkihJi7PstYecxYUsdJiSIkzpUEJ9SSvqGGTX4jC21PhXIpbv
         Bgzw==
X-Forwarded-Encrypted: i=1; AL+hErHh9dlsAg1daSdV31VwG9fknSh960sW+SL/m2XfFwMB9TZGN/j2+Vl2lbRfQkliubhHATA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/FuX7ZYwDeOKfFqIaeAJnIDYIEJC+BnIv5q48BygJ3dsMwRlvl
	P90kxOlG6szhRgEhg3q0mulgQd03LwscrMe3zQdaZHmQME+BhDlHzOsf
X-Gm-Gg: AYBFou31NBCVfvXTgrYuOma4E/JVFk90etsQV6VY3dJGviFcCfUZSCnS+iS1AirE38O
	Iaz/972cH3obm6QdTpismn4jCwoz/KV+/rRjiUqIUtW7mwXFzRY8rH4KYaKyH4ntMzr4qdZhYr4
	Mdhu9x+8qSxQuQDeZpmW5R1akrHLos+Wt6dvM8a+PrwGkX62/cZqX6ezFG2W6/dQbdHAAxVaffb
	iStoEP9qzb+gTzpeJcbUD5SJd8rMKhEnXcNKDHH6lT98WUTgqDp54V5bSUr8xktTQPMunFa0g/u
	w75XB6p596dnGhj3Qivg+movo1eSdh5p/+MeUVDo6zH79qu9ZoG7ASP+Z8hoAxYBlnXLmq1REpZ
	+1rqaMYwr0o0f7GcMUHd6+X7T5bEVp0nM5MRhrklrE8hmfCJraYEA+23MdcJGYotGuWBs9IFPeP
	Ej85AC6F8z+u8V2pMtgTsx3yq4GqsaL7zI7bT0NN1NSJ1izbcXk1bAe5GKXDfwGWTxwVWifc+cc
	+zat+M45o4n5sZxVh8ynDgAIvFc+GHTK9djFoCZWmTKfvLXFXgZVokOEbHmA/AOUPsC23ZObYbm
	YhDF4H760JN5osUZ3mAuHlKsoz3JZulAmNrV97it
X-Received: by 2002:a05:600c:3509:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4bb559f3633mr229913355e9.1.1794864399079;
        Mon, 16 Nov 2026 13:26:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:38 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:17 +0000
Subject: [PATCH v2 01/16] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
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
Message-Id: <20261116-halliday-dts-v2-1-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=910;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=TIEe9N/cyAzKgpuoZBtDZhrBfZnBIMsVZBId/jMf7sU=;
 b=dpF7p0w+OJpIxiGvX34+YlsXwN/di/jZgfYFaXfY2LGvx7anrS9naa9DX6XaW0R3KAm0CLz0p
 0yoxibSkrgQC5/lkQjgDmvTXyvnDrKaMbIZimtpZ/81OcVIj7o3EQjp
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Power Domain Controller on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..cf20041e86c8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-pdc
           - qcom,glymur-pdc
+          - qcom,halliday-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,kuno-pdc

-- 
2.55.0

