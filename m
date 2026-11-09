Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184452;
	b=bMuSykYTlaDklZpQSnfvwmJcIzIFrqlhAhIujJ9jPX7IeKkAxGDfbzEkhoWMySfADUZC
	 qDNCHTTuQmG2Ma2I3NF645BspXmie3n1CZMlrxz3LJMIRyAWzy02A8QV17DRx46L96phQ
	 jd3P4mMJFo9IfN5Q0gQ1h6brvssmHrS8WzsfegVrBmOn0thhn71ZM0jMlYn6FtpAGHNUv
	 zFGWMhwkJAUEL+OARFIYPAIGAqp58Rn1wNRfMsue6MARW/dKx9KruiYkOlEXZoZvAyVx5
	 XSbS5PquVqDby7sA82tgRSDJp44ycWX4KPNOZJ9XuhG9YFT97+gB2WcaqjIzB+APFfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
	b=sji2+WsK1vNnLJgdfexM+CuA7GzKBz6VsN7Pmf4982nOjEs54/m/pxHhf0Ln11rY3XHd
	 zjKLJPgDhpEFRBwkuRM6q+vVL4AenDKIhKz1s3UPQ6L6GZdaXmK1uXDv8N/pFZg6aEXBI
	 XSJUQFmKiNQVnJdr3AwDqC4AuKgenTJkQGzIAqz7xciTfqAcmRjZ5+frc9LEHe637Hb9t
	 7KRyz6+IYuD7LBEBBVY0ev8/ZZekbsBldAgqa0UnOA3ZSFOipRyhDoO8wJ3MDpqa4q8Vi
	 wJgz3OliH9ueGq90EeXwDW8ObbZHDd3sSq5LQvW9iSsRUKFHxkCgZvUJjOpk0gXjdmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CoCixarF;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57958606EE8A
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57958606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CoCixarF
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49318428d98so146010f8f.1
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184439; x=1794789239; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=CoCixarFqCoCmrDzO/G8fqVirIhnPsv50HwJ/s6HFbDkcoiNxY+oNL+2NBlpXyQCQW
         /1OJ8N6CQd61wHFy7o4kodMUazZ9PcMOW9kAYSZacBPlecc7DGw5QjRZnVsir79BU7CA
         ceYSJvhsB2yyXFOPZF0dm/RWbaNv6vLlOvPiLOvIh6AGgZKyAaHk/YqhQRhFwN+XiSHG
         segKkObPRaWOtrNsLz2dLoluZLlXFs+/fpkBzlm/W+3jxTBERpy5XE5AFWF+yXR4oO6g
         Zi8sLyL0XX5T1c8tMdUovHb6IBQFScFSod+2k/qlxaRQqxQTaFldpDuktl8GGLssnV9Z
         gutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184439; x=1794789239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=KR2hVP0iBcn713DPg7cxgONELL1ONFVfRfYXdjyA31oDqfSOHJFyVckMDLPdhcozrM
         JPciFhxT+W3zDUdiy5XQQX8JTYHvEksoE59sbnh4XGcY1YZZkOcbhQ2ZrduCxuIH+ng3
         OcmHCLW9mlWTR7J215wXm3mpH0GIIexK4vsjsx8yWXqvynqFBKf6XGY6azMfd6MsK1ye
         VEGnOGcHvEma7U7wRxGlr2ctMMg0a0qWh5u+aM3xwS3IoxKpRK06P9JB2AKokZh4KSgR
         abbssqKphZ9vHduegZA1Y6LKA+ZTlPo6jOgTNOF/2XiS7dxpPf7uAAgXUbhK5OmAvWr8
         Ga6w==
X-Forwarded-Encrypted: i=1; AL+hErEYK1V1MV/0ufOgHGwe6KyPXOkdfTUQ/DR6Iwt1dFtDp1P8KRpbdqie4UgD04ofoP4CGkA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8aCTQNB1LHODZCLZCRfe/W/hpDlizotTFm7x7uOryn+pctF6iX
	UL1B687GR2S7uoubC7o5ogFlWtNTUxnl7YRGJ1S/3WRaoNPAZD+fnNm2
X-Gm-Gg: AYBFou0fBxNWpwpXCNV/CjqS9NCXeBAYuwdO/KSEeiYoXVwUB9Urm78x6NnPWlb7N8M
	2J/BGIoieJoxJ5l++AmxE+icMqh1Jd6PMxflF4lEU3opVqkLn/wnsy8MWxlWQaSlDiWdVZaXZn7
	HLZuGL+R7Z2x39dEaUB4U/IuX720i7wctuyCHSYgFbQwR2zKbI+DF5SE9Y2zphQllHmJqCYH7eE
	5DHM+9wMgT9dBsWB2AzbzNcvpfOk0/PC4eH5HZ5E/xVsJdDgQcT+WqMCjw8mQcA4mGmW6FYAdWj
	pKjJqA2JdNi68ULl7GSFryG3W2/UAFC/KT6aVhH53JgGBWuxiWcEqC2NYt5JDPy2Wu86q1GbCmy
	DvHd/e3+7/2JWFMUQsoNf8/eAdfQXiaUiiL6HT4XzR8b5A6KtUY6CJAwQHVFI5ljzkb37Otm0Q7
	fqV9PtbgBA/j/UqWC1IBV/IwUFiVqyTkhBCExkzX9w6pGgnjV4aF+mUD59BSNDIO+3cKkGmp/Lp
	BIcH8RLFLNTwSJwKvCpgEg1pm32XwkN4bApCH9HADtYwk0YTRQjU9l09/VBXx+fsCLL8kGjB5KU
	I7agEtQQ18kY0aq0rgkmb4LalfkHoZYn6zGOZn+iyNMq5LXHPvmgJxwOfaeJMw==
X-Received: by 2002:a05:6000:3c5:b0:493:2376:81b7 with SMTP id ffacd0b85a97d-49588ecc152mr4851434f8f.27.1794184439552;
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:19 +0000
Subject: [PATCH 07/17] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261109-halliday-dts-v1-7-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=cCyX7eu7E67i1+mb+zFb+/V3MZ2Z8Bvs+BbDvfy8HQI=;
 b=HQwzvS1g9UbQKH8v0/XpwTYPPGyIcJ129Y8yti74NjNwgnbgo8LwZJmaOxKeuHMuvgkZ+EP/2
 IP5h1J7SLhzC0/e/TSquB9CwBZEDq02qBgUbIWpMHDatD8Y+sZaCkxU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0

