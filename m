Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864458;
	b=X31TX0R0P+VnKQrkbkaf0FnaSvN8uyLZiiHEN3YDy+jc+2aXhKRNqaTQXWBHBjVt++YA
	 1xjcsjyMcArdKfrtUTRWWGBOgEqF9Dyswxevj3HipQhFdF4tdzBCe8MlV/l41Whc5pnnw
	 oGPLwManMCGrTnNTSvkkwCHCoYmoBfk7HNBE2Ud9daOu/PteCtgLPyuxLT8Ik3pncLk8b
	 9WppaIUIIrHS09yQzWqWr1M9AgEG+aXhJtu0IgvUVjnmWz0/UhnmG30GHKISepPg+jYl2
	 +K1ANvwWUFOy6jqNg8IWeRPNyINX05mOkatIfAbfjM8iwBP+kx2hB2p3fIaUSPPmi9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
	b=DiEbu0M/SKQAGbeZ1iF052fI/aFS5Ejqp2Vg4jG/4XFoWBJsvjqmSDbujv94QUx7altH
	 KdTsg+wRE94OkBr1sC8KX1rc0ZVDUIXlPrFy7yBVC7Sazlir3bqJTmVBCqOBDiTYeUqgd
	 uTGDurh6I9LDYqUla0JFwmmZhrtSzyDNLJis5a8AK1knP3VdnRuUTIygmjl41gUVR33gW
	 FZY6ahikvz0nolBWfr/MZLGH11x5u3DTDFQKj9Ocu1/IpEqqnV41xdNrOTzwgPzoycdwm
	 OikL9S0mhwxmzVaMIbwWssXrzD3UmXSg2x78GYlO1dSQafixeJJO9Dv9/RqX8WGiYUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VE/noDdH";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56685606A329
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56685606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VE/noDdH
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3551448f8f.1
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864456; x=1795469256; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=VE/noDdHSoAOUpnqfSriW5TiP4YKQSspTr8xZGiF6Alj7y8Fp0P6OC+FNcMVhUKCML
         Qnlt1ExPLPLMhUvPF9t8tZiF+Uhju3HVC+GJo0N/oBOkeFGVAUtDjVC0/QIs9pLkZFlq
         BVhOntfvt9gOW+X4ETfqA9d1Dpy+pZmbcKkcVrxYa9mSVjrtr2UmheujAhdVQLyTkjbD
         u5TyM7Whv8yQ4vOnLdvHzJYP4OUdWhqY/bSEGVYHUVA990B3nj+/ozKiu3+dLOjGgshP
         s0tKkI2hBy9QymbfuZtKoeOSAmOEhogRUQ9KqMIsjSBCfISd+Ka3q+shykMQmzuTOjMI
         gq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864456; x=1795469256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=BK6+OTqX3gQCjnRPuRezNhO/RPcQTozfX0U/SAXyAB1wGktGJFnaY3ku9usBGPoZ+T
         Wle4apMbZHGqTgshc8gT8XBkK/YbkKEwn6wW/KG89TXtvlZD0iw2SlHmGm8dCcOhTfnc
         EXCExNdVVXzK3wjovpYqovLWEpgqI/SQ1BnCBypQXlnnwtVAOhtLR1rd+5cofkO0YZzI
         /X3MtTP4LjS8zBlz/vKHZMmHffgz79SQjLbtKow/rkRTVji1nB65QQqKJSNhbJWlN2eZ
         t9onUEwkTVxCLduwtgoNXNgyY+7OJcD0F5iI+TCHXkxqnG2fkwEOIo+M+n+jsC/AH9DG
         XjyQ==
X-Forwarded-Encrypted: i=1; AL+hErH5IInFaZT4fGlLm1U9QQS8p3XyERrJIkD+DuJEbTazVpdT4hd/6UjoZhVlpLyiMO41W5s=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ds5cU7FOZLBbDD9JbS8KBshP1K4n03IBnuWP7HAlYDgdZj2oB
	lm2fhjB4WDfW0KYMAqMtNdo0k00Sm0ng6j+igZSQgSD7xmZjvjYrO2oo
X-Gm-Gg: AZFdTZeojFmzQMtzr3nKfw5zOXMjftS8rvycCd2A8l453I1akucKRaAvV4KbmRpTRHt
	PKaSCbmPuJxqa6oUsszqS8qeQJWk2nNADBJx5HlNuiXpaVzeg3XxpTc0xqDTXJBlAduJMihKG4h
	qUY6BaWVLvt+5rgUOUZj9H+65RI9krf1LbiS+DS85DmwT4EVPK6ONBAMuL4Xq/7Y5RWcGK/PfNa
	gJGTu4gMQXZDPA8mjc2P9bSgN3eAv1kSe0EJScP2bbw6mJ2xv0QDcGAUJDfV7+TQLbxjkzbjADv
	cB0Z6757scxjSFFvt76BLSBT022gWS0gJ26Zd4y84qBUZXlH/4+Qb52rwfQ5fGBywsUD2uKQuJD
	wJ0LRfPLqvqUdh0R+Q/MRAf05zgghzzDpd6lK4RJISlsI3UyVZ8+Zd32hydfU29z5wJvVaMVOOn
	rVcRoFaRMf9e1uAI7SRWqOhF12Ql2HlhuL/hYqt1b4OMCNNx/3fdvkRxK8C2N6usivIwC8/pogn
	vKmRCQl3XjC+ePhOXeB4kYO12afe0P+odp4CE87xanseFVlwxB0439khcV5eKPjqhAFDq+Wy5G8
	pCbzCIdeS8W1dmHhMudbdE2uDnEoXECT7U7kRQOu
X-Received: by 2002:a05:6000:25ee:b0:490:b23b:802d with SMTP id ffacd0b85a97d-49c71d475ddmr22315194f8f.37.1794864455894;
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:26 +0000
Subject: [PATCH v2 10/16] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261116-halliday-dts-v2-10-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=9cBm/5Mi8IeF1ejOwJZWQD4SfyJ7BWDjVcE5y5kBsTodKh6u91I9h5To2Rc8ArYF4KPYJAO96
 griT0U/fTv6BDQooM53jxYIwB3vuzMj024ajCLGGuHNM9Pf4WE6Noed
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

