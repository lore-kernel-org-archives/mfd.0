Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184472;
	b=diwUZ1w72OuCjMjGdCgRpwL1vwmJ8SlbH8K2e8O35jJlxzoz5d5xftA6ZBu5lpMSj6M4
	 N6yvv7fsS9bH8frCAIz+TThBhPXTcqhlw8CM1X2eYdQbT/XgJVYyYMd/9uwyTENHSCFnE
	 wMNxOrcgm/mCvi+YS4pCR1ErRPwHN5Y6rmIYgS1ffwIXosCgub+9hRQwqrkQfohRaiuyJ
	 igK+YsW0EAdiCJyvJX47wsKEde7bgbLdobdvG9/+NoYHVcnCjngcfo2m1bAUr01Tr8rn/
	 cJTknpwQdJ/j03s/onQtlro4b6FqpcQR3j7Ui81T4fjzPtWxWmI2QCVQn8wvc/XyB7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
	b=Yy6YiEoTV7W0+BL3glBGOW1bYe5DiRITjtDnTNanHf1AZ7KKeZpBlX501GItwzuntnNv
	 xisdscp7LKztkBed1hoXIqVQtSzlkBu8IbR56Je5rPnd6If6s339HMs4GxdzOX44TbqhK
	 nEIKcM/ewDt0p6nomwnO/tIeMATlXdwJBtaYwWoaxaFZIX9ebuDUU4ufFSSkjlXctwwGW
	 bGviP7QiAqmYTXwpYagJJloIdY80O5FmUHdZMBR4sIAZkFBauVe0ILyiwpDV31p0Eiox3
	 QaSvr1ebecwc/eTs5DpApu+kI4tVgPGQ4csW9cibXEjB5f+WR02GrcyFY8YxrvBFyuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzGZQZ8;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4966082BC2
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C4966082BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFzGZQZ8
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so3942735e9.1
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184471; x=1794789271; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=NFzGZQZ8E88OQeusVzC/ruIqklbpYy8m8/ku52y22QfulNPlY+E8Fv7Kwtx+ojXzdv
         r3sWclQw1Eb+ClvAw2bwY6uGhZ3fhIcGghesEfKFAcET2W4+Exc+bl18b9icRNTmurHW
         uy0aOoN74skpR7txpX5I1j2hrlRB8JtxOpaxZwJtJTN5HUD3R1OURxOfZ1EdZw1Pg0EK
         BhnqbLTAfo8pyY2m2N/AyoHLaKRBDrOI5QXJvwRBypiXey09qqFDMgC8YevHj1wQf+JT
         iEoRVfluKuh60/W/jw6CZXs4UjXz4MK7Y0cISGbOxVd1PwxBy+megGW9+5Y3kld8ZlVa
         rzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184471; x=1794789271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=JDdLSP4GRR1R6PkjURh6NVU7ue6z9eVqEgzdQjjDhGr9YqBU8pFqCINLLB6TzhsJc/
         ElqO4vUiQmY7jCNgbMgHLPOYIUxt9FcbzjNCR5MkcDdIa8qPU5gUgWmAIdDObpZ+h+xF
         DzZFj7PKZCwhZj7zOa/UK3W4gu9K2leJx1kJ9ajffMPzeWunCNrY7MXjZnHrCLd6B08s
         4yfzNNBLs/wIcd1J1XXrL09IEQqqv04jksKNLSEz4zrOPtkBxQjFuagyPczyustqlUHZ
         Qpuiogb/7x8lWO08ofNzq/sVArO415hYTNkAkNYn3/vNu/Tk/VL+uTHrdTWCL6CoXhBc
         XvWA==
X-Forwarded-Encrypted: i=1; AL+hErFyrc+ZvowsPZQOczj4zuwL2JfOsNrs37HFUc2Xs2GUug6akiaH2xfn49CT3U+CEBHpp8Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z9oIN0SpQWZALZgOKipUL0g+eJtlAiEqMrfGAuLBFD12eKrcZCp
	EEuOsIOp9lqbxFFm0Sp4Fxv8H8fsZWXUX83gYNqrH2b4zrTHNB21thio
X-Gm-Gg: AYBFou1lblruBrMwvI1hcECrFphs1wfuPOviJQbiMBPQhcXboonjGI0c/rnBPlZtWg8
	NoQ1gQau592ysMH4XV3mr05/rQTJelhS5kHUwyZ5aSsc9Bca6MQFVOvCLEybjJ5icUAmhE4D6xL
	JSThoGsY/1gZCfX2GZltG1oHNnXrTu56ch3U/ooIv6gjv1dduM2CytyyowQzSYLKVdmnN9sYzDf
	Uz4yiMcv0oMAIfaG0q4bYdt+1xFzPaHk8Dd8Xc9xnzfYZSTaPZimM0wFDgU1If1XxLVagtSNqtp
	IEvkYh7Irl1mCol9XsgemFubl7mardmvMPR8nRRXqMy3prO4QJDbaniY+qmTan2hgek9ulyeWBf
	DVV3pM+CtVXS479mjOkoUvqgN5VeXLqRLH1k9Ja4rbJTHRPFRpbXWmCkIxEOxVd55nL81YAg0M7
	fDvXmJyK3rLDaOXAzfovfYnDu7nI+wsYj5WbPITHVfK+kwLVJX9Sqg+IttVveFsL2okSL+h/E9R
	mkd1oSsnt5UVEWBhPB9uMd3SIbxD64WbVRVCLto8qw6vYftE2iApLbvzp3/noYENF2uxxHLyGTF
	F82WD3T5VWfGmTduFsd0xiIkDetyvFKfNrTCA7ei
X-Received: by 2002:a05:600c:46d2:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4b963c814b4mr45217895e9.27.1794184470772;
        Sun, 08 Nov 2026 16:34:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:24 +0000
Subject: [PATCH 12/17] dt-bindings: cpufreq: qcom-hw: Document Halliday
 CPUFREQ hardware
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
Message-Id: <20261109-halliday-dts-v1-12-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1136;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=/5q7xJNdAtVYNP2eKqnOFRxkwGs69ZAxtJgwpCpPYPc=;
 b=gh19qIBvqo941uuBuTtSY86YfaNCAEdG9vJI0o/4tLOqHDCaja10/kLnOnTQrwdqkmy4TCdF6
 7e+ZDYLm+CcCb5BN2fAjGQTjhEqtQqzl3jdn43oLAWX5E1v6iUbyst4
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the CPUFREQ hardware (EPSS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff172..d6040cd293f9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -36,6 +36,7 @@ properties:
         items:
           - enum:
               - qcom,eliza-cpufreq-epss
+              - qcom,halliday-cpufreq-epss
               - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
@@ -135,6 +136,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-cpufreq-epss
               - qcom,qcs615-cpufreq-hw
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss

-- 
2.55.0

