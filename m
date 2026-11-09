Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184486;
	b=r4MYv1MVaeRcbLPCGP/5lhJEXXHaOsa732pK9WZOP3z3OMMXPtXO9OEJoTtCYxjWXrh9
	 gHe+ZTo9t4l+zUbmO/JCK6UQrZt4pihVe9Xeoif+tyFw7fbEaHBaXIgASW28fKkEs4fWV
	 WFqG36keIJirNVryC180Vwj4lB5+HFRFNN5rfz11INzse3KhbbYiPsIOw6vVFV+YfKPX8
	 mgrAG3Lasmi9sGEjcYm8WvN3Hyu7zxMJ/RhuK+ErF9IXcjRXhPy7cyhwXVCjv21wiBWfJ
	 OK/n4wUJLd6ahKyM1cKAI/nna6rhtanyIZ9/57bBHyuGR7qP1kiZtpf/Aow8UgD5xZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
	b=nPhw31E6n91BHmPw2LHVedfrhRT6JLXWcVIsnu1hlVCNN7EgnatHzlXqNot/JxSu0USh
	 LHvHzIY9OmCEak9b5byE65xgEl9lbJQ+OC+tZ6wQZ5xAhOlqgA3M5o03j6M1UzJHNvqCz
	 F5pCvUMf0Tf5RMjDjv1GtiWk8Tfp6DktJLTvqittDkXDqhynxt1EY+UjTmuOicnQXXPgv
	 aiddpHu+Z/xDqb1xsBJGWPoH83AKV6is4y+qtfJW7r2CboE6WC+2CbH8Ty/C5ESUMZmRc
	 54XV5Kn5C6eOIK/dTdeXB/gZ/p881BPKcEZW1WeR029V2Qpt0p6BAVkwQb9QuCnrgnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3BgkdO+;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD1606EE8F
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AD1606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3BgkdO+
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49412eb1474so184580f8f.3
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184485; x=1794789285; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=o3BgkdO+ZlvpxXAcd94zapMw11kuwqt3putE0pzrDSdFabbyGrDyJeocIJDYXImo/w
         gDmYCUXi6Mo2jvMo0Yej3KiV3B1x9OmDEdGqqLhzzGHxrB1ZCh6J30BJbXgMGKLvlqmx
         7vryXJrzs8VgB0LVEHrjC+vH1mDQnENyjMMYDK7aE0+u4bz958CmAhov7vKXw47UTOyA
         JEZD2ji+Lkx1bA8wpqtYOEdIw+Ckm8nUryd+SPdkjI+hOfsybH6KeAKUdnF4JOrcyXfl
         V0kKNGcYDFm8P+o4agY2tV0il04mDJ6aGUIwZY6WNfgJL0M+16/8MkS90ithdPxbxKG7
         xkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184485; x=1794789285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=qjb3pP443HWww8WOc4h5zUnVZkinrWh9khL3N9SRF2FwrakMkNb8BH/nQCkult3du0
         ODEMnxJKdJTz6BWrQQXl/9KVBbYF3kZ8NEbQMa2cL+oXDslU+p3O9dtVxCkxykbZB0SY
         biy//aMtzh2ifwBglN6+548KZLWoX9Cnc+9XxZmFoZ5BxKGCfRj1TSBB7K46+hfMihzk
         G+FW5EwP5r/93p1W8XGiDl+Pf7dEEnrXKLoLqvuTWKZo2hpdGRLGopTJ9iKL5um7L/r8
         mN+1fDtPieH0KKTkQ2oAMlw+7vD+XFkt5yedp8jLjtEUCNb9NY6Xu809jOZvVxQGN79y
         Mnbg==
X-Forwarded-Encrypted: i=1; AL+hErE8bV8qZsLX/jv3af7789/AdvLkiPpTxiQO8q56XduhuTz1ln1kEQnhrKiZ2IvWJr5V8fw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8uPyk6wWClfXZv3/OBMRQRFGg/fMSrAc2MFLl5DDJfg6ZZ6xzI
	dvt23zk7F3d0YsB3FOsaf51Cop2WzCiK/+ENins9zLBGtcpPQIw2prGD
X-Gm-Gg: AYBFou2z2Ho8Nt5s7MdPa+rB7uQmu6oP4/tXWhj51GLdFZ5EHgLo+UHnDeA0Gr0XqY4
	1yMeg+RBrrjbqdyxOkyP+1hIkQ6BqboRtgEe+IKCnF5j9jWu3+BzM5RjmtXOReKmTViPa8lj1fV
	+VPrFJ2LkKPW/MPb6sGXrNpYOUGOD+WafQNfT2oGXu5dKHD5HfD7rh1FbuskSIJabJ+m+8eelhW
	lAZv3i8/O3jCsLojKKa1YU3pn1YsVSFhGSD38vADukCE4KX1Z8vKjSHV9UQj8Q4VDSDqeyHuB+u
	1qZchfBr18u3GlP8jNJ5lVwN8Gt4ExJ+Eqdx1ymBZ+FBw+WWBpQjyXl9gZU6nwB8S5Wc+FTK0a7
	uafl9D4gi8MMZdGNJMmrGUnzQZa1qFQPtazbuTi3EZODktHGTSG4WTqXJtznNT53I8rjd0TUiuL
	BIN2Rj9v70sMaoAG8ElQ9p0Ynbh9KXDBBkAerrGf1BlbQkk6Zw5Z8TZF+JXSItdTJ/SLF5IJm0a
	UeGYpOQwTM4Qh8HF6htrzhOcAn8XhK6QqRMw1ltOkW0SQ0ap2nxHmqz6x1QLBu8D3YABHGEEWh9
	7aQrN2Wj+0wmpqX8+R2+XVGa7YdECH0/yZGWajLv
X-Received: by 2002:a05:6000:481a:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-49584690551mr4596063f8f.49.1794184484831;
        Sun, 08 Nov 2026 16:34:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:26 +0000
Subject: [PATCH 14/17] dt-bindings: interconnect: OSM L3: Add Halliday EPSS
 L3 compatible
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
Message-Id: <20261109-halliday-dts-v1-14-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=844;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=gWRtexQl3K6zrJ8s8OX25X6Fe6c5gXvBp3k5tSGU4UU=;
 b=pnbK9TbDaJw63lMsp+XBx3cpAT1m6LlRO8M5pm7At3undTaYtmQjFmjLHcmBIU0XLq40cIoX8
 jdWhe4OxgWuCqPNlp+TJGp7ld3LSdzNJFNkDbr6brDzv5M8VXRxZg8B
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the EPSS L3 interconnect on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd6685683bab..6c3475005a35 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,halliday-epss-l3
               - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3

-- 
2.55.0

