Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864429;
	b=Nqv/7CYHAVwkgcA/02wvrdi0cHcJ6UQpAkXMjv/M+suzEPYdzRS4HrOvpUhyIFaiS3ZR
	 uDwcKnBaVhCb019bf/gkHYiBPcxNmMj42TP8OLj27SfNF9KZzbdGyHqgKYoIljxkpjnhI
	 OZ6LRlaIyOXAn8sWPaFXahXKOm45p3MKkbXN33E2ljl7udZNU4q8EOTJZ+tEC5NmrzmUU
	 eHhyV/EZo776Fs5oi83aiQLzIQ3Lm8Q05mP+bUua0jyibPAQSy8f1/u9N+GCq0ceC+0o5
	 y/wmfAaSgPiys63ddAvinfIGKcJCCfvQL/QgDhuxIN7GvFBP14Cywq+evlhHbneKruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
	b=gc+hxI0O1HmjS20h1/DclOSS9C6GhuO2AUK0xb9FbEE1xHGOdOvnagM/G6u6mtdh5KMo
	 TqAKMxxlvXaUYglWAhX6CexywZYi2kiIwL+/1ZyWOxKcXzP5nKoPo5UdYpYUlveEIkoEu
	 YPXodqcfw4ijSUEswYlJo4nC99RLKUe+hkXaXguyLkAZxbrmC0YASQK+pWid4ND4ooSjt
	 rE2fBO9jC4kWE20dipVSAnHzCYLTly0uD5ojzTMTfrBRNxAhAXXQpVuIzG9Ty/Wwio0HA
	 6hIBH21W1TNrqjmjTtNGgkDdQI+L6Cc0RMVteD199VQXDnLVvRkfnI09CtyhjjQezgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q0O/a964";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74232606A32F
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74232606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q0O/a964
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3edaso193690f8f.1
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864427; x=1795469227; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=Q0O/a964qe6zvke0n+YZAreXFf1Xe04yeraddaXOyTbXiH8oDUWLmFr2xIRhyOIIeh
         nXHfPTtJuy7MoV1iKRucjYmg91kzVdshAvwmXMBbisUEUWyJaivxebyVzo89DyTNBN1K
         56qDsk7NQ67mj8agBhXgmPZiN5iVFaUedW+LxeDP6jxuCRdb3b6Nym2AdwYDxzCLtPnr
         L9l03zmWsAFf3l79VoecKkOAZjrB/V8K6f4KdW6K7rbitjljnvRR/t57CKm+tTztv+oA
         wOn6+G1TbeTcwjlHyygYbjBhwaeIqD4G5Y1WeJFawUOlCH0Mn8vKjzpfPcGeArCIcUQl
         mf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864427; x=1795469227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=PUzp+1qGUlYjX0cfFOThx/cPhVxa+wkYom7AZauqW325aUFAKZqo27YjjU19gewgMU
         z9/anxNdMgMAu9o47M7hjoAnmYTecptVDSKuumjw4RJZp2Bc94LyKfsuSD7qJdos56P6
         xoBg/hUfKoDPMrIR4Cqcvo2DG7f5zEDYhUsie0SD4R8DdHJ1js6nNe4jDoKn7aPPqgOV
         aK3B8fK1BcJX7uXpRyqv0fqVcHP+mzBrPOBeEsh8NcHkN54+KdIF4fRwVxhGRlEoYgCx
         D2lx+LCGA7KW8vJhs8aYlcbK5sS6fOp7BFX6/h+rHPFDfBqWVbIyQFGD1+Edl77PteL9
         tjYw==
X-Forwarded-Encrypted: i=1; AL+hErFVxOPRAJm1UyrvuhwfBtANDc7rjjegrLbzBYLLa1hvPrbLUXHnp2aEWTQjHAJAuNlBeno=@lists.linux.dev
X-Gm-Message-State: APuU4Z8cp4F/BXQI2qU0QY34lzfQh82K2Qom6CkmpXGkR6QNYSoC0+4/
	IxjHeIXDBmOEtDYfgazxiFipdjasT1/4HZRqgGpcGT3cLO3w9kAcNAcN
X-Gm-Gg: AZFdTZeFg6PvRg6yIeAnvRHfTw8gfZupR8A3q7LfUZiq1boQtcmF6CBWz2sFel+iJfi
	8PSHgKvp8fOlJ6a610JogcwNxABtC72ON2K5VfHX263/GP+gvzI6xw87pmoF4mDLJyqSms31s6b
	+l8xpeGrS/130P2qYmOMXbTc4rbkM5AhvnNiGQpGXF9TRv0Ov4MBxcTlCtmDa8We6rixlxc4J9k
	1bxE6fE/k8CvKbFg3QXiOZjNY/ezxLNK7rQJmSyTN0Drm32AUZzOOVjGJ/iuVc0N6uMnvKjGJVu
	R5wdyaqIJ81Rh4D3z22b/LSzYhzMevyi9gu5M+qIS7umWm5AdUM6WYOJkZCDZIILvilpMzl40IA
	1Z/7jk6UC/ZdDoYEuhWNO107KKQhU7Re3tMo5Du3hoW81yWm8kM5VcJdZY2I+nAv/WD9X9DnCXA
	GejD3Ro1UdSqTfdHoEuFn2NDurGJfmFZJGUHdKrOXRwgT9RFDbWFeyzwqDlwndYh024lhzrVBDb
	IFuTbOqewkTXu7/k9Vo2vLkuBFaE21CRpo/3PfedxDUsJbPF530GTcrt/8wrXiJT/XusiRkKfAb
	u7PJ/AsNZnywy5HTDvWf0mf+1pZvAZf9m8G/ktvPuA==
X-Received: by 2002:a05:6000:4a01:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4a36c30c79bmr1458441f8f.1.1794864426917;
        Mon, 16 Nov 2026 13:27:06 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:05 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:21 +0000
Subject: [PATCH v2 05/16] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261116-halliday-dts-v2-5-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=cCyX7eu7E67i1+mb+zFb+/V3MZ2Z8Bvs+BbDvfy8HQI=;
 b=jodb8KTCYJuS0IWgZE7KB4t4x5w4vx+XqSva6vd9XaFcHbRLapvwh0kujvjIVh3aEijgselYV
 FDfNsOtrAj3APDDTnmVV1I35ZxWejVLlN13Q6QOSjvxv3VTGu5EUwMp
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

