Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184492;
	b=rgYG6laPGc8OB/q3RYVmaEUJMRDHA8XBRZiS/S5QBk4lw7gomSEEh0Uik0bdVW+0ecOs
	 OBiEt1667tSmgqUj9nvK2ZH9ABHCEvi88/xEfiFPegPRrlfq34xZ0pLFuQPAJnPxzfOy4
	 1ZOvY0uXvcgGLlvFBnLlT9441moAluMZOCgboGFTcbHNTZOm2e+kxBF/nP9Tf5o+sQYFR
	 daykSYPx7NXn9VAsT7MKMRzpGgM3xDPcmW09J3nmV9De1B8R0sQTOkrdNY5r41dJwOgtZ
	 dCqsrHQEJPRFWty12AMZPB2xx7wyXwkpJtaNsmA2TuB8G9WnwS0eB1TpS9vlq2t01kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
	b=0vnfud25WA9tgrunngLUOWbH5upQR+l/wyw1w8JRPDRHuyLPD4EM0KHcLvFXvNq6C69t
	 6z+govDnGkksAA2Jr/q4SZoapTfYfkaksu6g0nlvOsh6q9SZ7hiqwyGhjGSLRtFdPDRbJ
	 TBokNct2IbKbk42ALA9BEXPRfnQ5+iBY/WqZwLMnkapUZVUwRAkG/IPFWrdhUGszq1k95
	 oPA47xdIHOoHvIKtxo8QN93ZWWCAX6gjPR76NnmE2nYkqvJqDO8T2H/x62xuScmyGirGS
	 mNUcdfq1FLzZbML19AfCbJ6xsVzepZQ1vBIJWarNIZqZf5M+shlix3eME8QoLD1FrIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+hjMSFA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C4A60A3803
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C4A60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+hjMSFA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so2796515e9.0
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184490; x=1794789290; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=c+hjMSFAhoNVH0t9UNJ7JY0Rq6oYBP1/A776brQSm1Uls8wQjj+FZwYXJniJ4eCyxZ
         ejoFgD1/ZCXMefrdOHtcDa8WednXL4OOzM9QhmDL2Aofyts5ONkdcrdLgerna2vp422+
         4Hqw+zN8RG1xkkTKIzhwgfr+pIIQNtWu+ke8wCH+csmTL7AtW2ytIveqWV/Y+kaqAEOk
         aqskx0QX36J/I4h/VS3U6y0rhwkmK4aYNszWGVSRI5o4YE5aK7SG1V0uC98VUwByQ+se
         KPyb9llIiprsy6f+427c3LAa8ZPzwz7mrugVltEwNPz3kwHHQSECk18juR9DOCri7+aj
         A87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184490; x=1794789290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=yaqvFo6c0mYKavxYsubquKzb/zBQ8UbrV5+WfNZmYyoWQFuwPdx8+j3A6KwqZrbJ0t
         AlPs2fgO4ttEC7SQ7vl+ZKcZHqu1HNk+1qCpo4XmlZHo/X9Fu+VlTnpC6zk19JKOCWdS
         BWy+kOqH/w3tbmvTexWh5nNleB2uDKzSy0iZzMN3AulipJAXIchBxuVWV5Q2Rq6f4AYd
         /86LhTd1irfkRdr5YR7fVrrb1vRXmF0r3QuVeomjE74zNdob+kly5+78viYJ8bQduMjO
         LQjQgefe0PWgDJbVRJkyF254ohlt6h3ApZnSUGJoXSQ8oGJUFmi+UvX1HS15HK5/ag7r
         pdeQ==
X-Forwarded-Encrypted: i=1; AL+hErGnSk9Ul77gjvdoc/KJ24gnA3TRHSNff/LafEuH6Uf26P60mv3MeFDIeULb0j3MzinmiQU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9NO3sC5u2sfHx/+ewBO9IMETugTQLUdfXwACIAXR/aNTYCz0Vw
	N57sjbXSWzOYI1W8/YIkohwpCONLkUNVd1hqKbmeYGTgS4MsE1hMnIVP
X-Gm-Gg: AYBFou3aqPbvJZ0MV+Ay8k5aFo4rW4ozC72nQRgRgUsSmOLY/8sFvAxQ8FGDGDTcAGQ
	e6OMdGitVYLEYjyTwnCgQ8jeiXCZDeqlBzR58teCt3u+U6APSqend4Z9Zo+zOv5TtzQ/UsI/3Mn
	oKJB/CbC+IXbRYzjnK2AbYcLKKXHpdPoJpmA2vKuUcoKAJbcZU7trJtBDKzly34wKR/TN1sGb1s
	cUIGWbsfwu/sNySCiIKyw2tUEFsML0S6LtqwJISGszbcm2mkrmeaP8HNdngOHvyjkOKeDtD+kDJ
	760ewSvFlEAAxjPzhZa9Q+pihSbpFFuO+Qh+JW87ubmKdPGvEn8xzO1d0ldcOd3G9eZFn8mxMpY
	xINc5ZFaypOBVywxEBBkm8T55bcIx3W6G27wAuVuOG3whMuDE78gt2alGInvTKa70KYK3EBYrNA
	JZn5J2nxdVxBkjk9ONx6i0aY3qj1lueG0MBZuhUG0QpGB+oeZTIvn6mnbQpjZxJnpzsh7G1ASQd
	8htXq20Ern5/SlYdHAED0lnOalYI+Lze5kV9ehv1SY/ZCKr0ycvJaI2QeGrbBKmDegIAalxYKAe
	Ns/3wVhA1n60Z9zz4vA/5iHlyo6IJ1/7+zu7XxlT
X-Received: by 2002:a05:600c:6218:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4b8205955e1mr111833455e9.7.1794184490117;
        Sun, 08 Nov 2026 16:34:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:27 +0000
Subject: [PATCH 15/17] dt-bindings: arm: qcom: Add Samsung Galaxy XR
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
Message-Id: <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=822;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=GR/L35KkjRTQHIwoej6N0ZVQiPJDeokJdA0dH1/xcVk=;
 b=+pMC0hU92qIlScFgbvyLG0yeciXJR70jYMcQsgbMkAruvtq441EcqoAR24w8+H8PddfDvxdW7
 NeEMu0FiaHdAmbbpArcsFtCmr29OynUnIXhIC1Struq0XQSLzW/yMcu
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Samsung Galaxy XR headset, which is based on the Qualcomm
Halliday SoC (SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..b96ee339956d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -94,6 +94,11 @@ properties:
               - qcom,glymur-qcb
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - samsung,xrvst2
+          - const: qcom,halliday
+
       - items:
           - enum:
               - 8dev,jalapeno

-- 
2.55.0

