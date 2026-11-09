Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184428;
	b=T5659tZMmxyU42Yc4sdlduydNVMiILBFwRVxGD/h3BR9ENKZLaD4G+/sMsOED2Ja0bTb
	 SwjF+h8xwZBUt/mYfXsaBwbOnkwcdeBt8J1kDp4O8RlpGLlThbLCxJpdLjtDAV6XbhjiF
	 qk8R3zi+S13Z/kMu16A2i/L2isgNjKeLC9Pd6xcoIH7+fDfl+02ZiiDkDafmhl759Xzvk
	 dQmUuYFUe+GsoULpmHNx7vT7CztN9XzWlWnBeeMb12i77B2OCzfdbHW26kS7pK01lFI6o
	 QXOlSBMbP/HgEGEhDSOIp4Nk1Vt7QIBmJ9dSyuY7nJVggtX5e56DF3c86BA/gniXIFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
	b=yjh8R1FAEBGZcCxEEmFX5cfAld1EWjUO379IfL31ekDzQ2CNlXa5M6f+XsCtenaNcJxq
	 P1p5KdhlndcjdZPBNHPdfcsGyWEzyGKFEPsV5ulKQaeSk5WgAx4G2qoH/9Dgcu45D1JAL
	 pEu+JvSPQPdPc4qcaMpGi6Hg1oXyZLgDWXWZdW0KPzsan8Iqh144iwVvz9AJxei+4cOwJ
	 STplp4K+RDTLkCKKieFvX76QQK0zokqxoAHiUOcyhSb0QAugGVV+Ot2CBbfi0dxWRvEKl
	 OzMyrFg5WaTZ+dqALOu9d7ayJPTho03l/gotnN2I/KNHCDGCbfqehNBJO/7P2xTMoGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dd2b3k92;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EBB606A331
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 00:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EBB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dd2b3k92
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso2456265e9.3
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 16:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184426; x=1794789226; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=dd2b3k92e4GQqoIQCQqQg25aNWIE1HPDhDMPn2aWa8oizeqFa1u5NKsaYPC3zLGGen
         wxAdr2uwg8rAZ0LsZV4xQeCd7HLwpO43phJGiUbZ6DlN/LwKI5CQof3YX0ZXbmFbzM89
         gfubj4lndKDn1Z7Kn8SzsppaeiAjiYNuLyyIfVhx7RJNZlEc9iRC87M9MIq459FflPNv
         vBLspogMueU/bm9aPUkDAk4lf8zIaru2z/P4S2yP1Q/cpoH+yhtCkGLhjn0990/LCAk8
         ydtCnJdFBvEqFzC5NuPGIDE1rE7rN8JZhHMJUIdkyOeU2k2YP6KCLoXKbkpIc6Vw0S9L
         GWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184426; x=1794789226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=Ode0PeAhlXGlDHhupQXTUF3sdMjkIP4q1SfaL67G14JSEx1r+fTXYk3Jn+K8YIqhbr
         YPzL7mdvruydCkQZRey+Q3pGFypBuwlMw9qHZys5dAersHNnKSGuKKiMxErXGMW7PuqY
         8NmdsPCl6JW7THB+Hn0dfnt8pDAZJ3jrJYUXS31m5j5m6iZO8Lh7U/48zCEpFu8lrYG2
         F4kiBgyXPFrD3Zb3FqJZvPU2XUK4hsbOlEsVd6csVead7Vo5xBtTQY6j9lUn9MTwsZ8P
         pNwX/CKW7yrjW9tZz32EuE3mC+8AsFBb4h4YlicWPCo0EP2qm8dPW05Mv8RWU6SE1geE
         GD7Q==
X-Forwarded-Encrypted: i=1; AL+hErHCSZ/zHTBnlcWZEAGwHxePfSpOcnvk2e4+0kD5+4iBK8NRbfOhE9knwW27Wg5uXJVHqSs=@lists.linux.dev
X-Gm-Message-State: APuU4Z81KKzcUo6x2nYngzUcs0KaYRJsn/gWSj2nXvrUYX7wtfyXCIPJ
	x/9reXfVYB/QKWNuuX7Jw1UqC0hSun2trBPdaP7+dIjD5sO92wGiBTgU
X-Gm-Gg: AYBFou0+1GE2N+MGDb0XasvjbbmWzNUB0LwD+Bf1ZlXJyUmRxHhtHMtLLRCKxc/fd+H
	vBkCy4WgEajjUzmIFU4gP9qY1i98Wo2F9QXlnv3aWaP1l1fNwmGT7gGiwXMHY4PbVKp9B3leXhh
	mr5fp34xU9td7pqdvJC62PS0uUwQIn53BgFmxnPqg05RFybTEqD50WFNAMttqeLY0pY7BI55eLF
	fbLKLWrSdv8NK3bM7YK5BdD+RTeMRruTr2tdDABCKp0NCg2Kg2r98M/TSuW24TNJwglcLlxJQRa
	I9OZ4VH7kTB6sY6VRB8qDi0KxP7HXmJTADkFv/nOfSZsl+EdlwjqhuY7rgfa84PlqtUJgcJM78d
	IDAp9oS1TPrHuZbDa7rJrbPDecdkud4O+1u63dKNLwdWZADHHzzVao6qyW6bphjAJJS0/VxVP7K
	GkbU4VV9s2Iu82GHbT3z67jSuZaFk070B5VpXVXKioYoSnDA2Ys7P7KFW+itnN0pUSWxTkC36I/
	jBY2Td6xD/YBrazp4hy/HTf7q1tkvNFU/jb6GVKVzPmz1dgoh5dFZpPbFJjWabeJQ/Munazfp8k
	HiVXWJhC+QCJFN5VBoqp64YtMTxoQDqh0DTtqD5c
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr43372595e9.35.1794184425700;
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:16 +0000
Subject: [PATCH 04/17] dt-bindings: power: qcom,rpmpd: document the
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
Message-Id: <20261109-halliday-dts-v1-4-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1003;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=el/mD1li+25cayhCgWCSoEmU7xbrdbDdv2bm0vKCgf0=;
 b=AAbKZuaWziyLaKTlH3TAQLDLLUPJbQQuUGnW2/exeZlWjcPjeJvTUQ3Mzs5Xy0Jsi923+4Jy6
 HYpQrlT+Y7QBXM0fnEs6fk3DZfReSJNsf74HPnCiwzI9V/RMLtbXEW8
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

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

