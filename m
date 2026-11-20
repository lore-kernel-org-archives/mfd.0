Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202500;
	b=V1U0SoCK7W+4RFuEaesGzn172Tv7GO/3UpyWx4xeS/nAA3AncMiSjtePxWskkNKhFHyO
	 ZaP6FQXZCSS6pZ6h8zFctzNlF4bl+XyRsZj6Wu3o9VVTqlkSGeKchpJxVvGUX07ZBGQnR
	 U6soIc9q4aJnQpEtgMrh0C75JSiv7wK8KeoMHV9H7s3f20iyS4wrOy5rlFHQS+pEvE73u
	 QhppXqeNxP6gWwp/kTWl3hghvbTqk0OSTFl49ojZb8wbn5aM+G4tV1ALPsJ2HMls52Z4s
	 XAnSJizX8eEqrOEpeeXTd38DtfbH7amcvFrB6S8oDxjWDOj9yhDszcczyXSmlAIZhCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qEVHtiKYBLIel8um/QH5PKwY2ZuAggHrE4chfoek6uE=;
	b=hdymZ+PyCmljC9PcrJwqttPtoAiXAVP69011FB5I3ZArBRxN7GrigvHr1dbKxQfK7oil
	 MtxkJYwDXK5pHbtP11mTTC9A30MFV1Ba8K12NLPQ1G38IunKCVHFowy4WQS36L3TOv+LO
	 MQbbFuTdPRBifrP2uZKBQi8ekAR4IGmqfm+DhNj6Iqm+EccGMoGwtMO+Xzo/ACdTMOELb
	 mUEqRtElGZPOLsxuLVJj5TxJV/Yz/iFyqIe3bv1ZV8a5Ek9MrXCF+0CZko8Am0nHuISRh
	 Em49HKv3d+BwQbB5QW1Q73nl/BP6mYPEbYOJBfGS/uOGsSAbFEtjd1eOhLNsGnfKFIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAXtAYqy;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C01606A6F2
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 19:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C01606A6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAXtAYqy
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so18992325e9.1
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 11:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202498; x=1795807298; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEVHtiKYBLIel8um/QH5PKwY2ZuAggHrE4chfoek6uE=;
        b=KAXtAYqylsfRHHGVdVtCqY/Omu5jaBBvbYjtH9bBsJ7KAFSHHKigJFqZBMH9FH7K8W
         LlLxbVVkeRTgfqzPWtBMjiLLVZPgpZk6/9YYqeyP9NfIHUQ90fp/bIaq+5y99Ykjke67
         1Q4OxgHQ1r5hs1PCPmrrvIVkHaxfUXBCU14W/BnxSW8KwDMqcIsVD9qodY/90k/DAVjy
         4tjiMSryPhVFl9f+1qQvnzbpG3POu62xzAr6/ljUQE1rqqF+FOK9jbFP2qQdVjarn6hY
         3Tgqaj+hAkp2HO7kHSjVcuJ0J5HJlhKV8eWYP9SkDY0MtY4NW2UeKnNvlhVo5ywUybN/
         4eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202498; x=1795807298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEVHtiKYBLIel8um/QH5PKwY2ZuAggHrE4chfoek6uE=;
        b=PXUFHQyodHwYbKW9hw6EDrIqgZYOiIVw4uHge/HvU59S3//Pn0ry4UFV/+PhxQ+Jvs
         yJGTCQ24eeE9dz5Vqj99LHsg+qBT9SLmjgwiv1WatlRvrxP9zskIR36Q6wAOp59UkYTN
         kXpf1Prjn2OzUAHrXeqAFMIyYwYy1VIxGFoUQD+wMaM+elcFbRSV/FMZ815hUVsawHSA
         x45QM9GqzqzEWoakNP1cT16/Oc8wxfQU1TUmi0mW+GS6k5dA3WwTzntXccAxenRMYhtM
         zuHTCRqbNm6KlJQ51LCi7eSJ2JCYsXn0B7nIp+4mZDI7vTGTl00ou09pu6MoNvpixkv4
         tFnw==
X-Forwarded-Encrypted: i=1; AL+hErFydQbabC52iUgZyh9koa3AUsue56ZEbZb19MMaFM0i/R+J/qZhjyOq5AcdCB3sK0zx678=@lists.linux.dev
X-Gm-Message-State: APuU4Z8VVhuk4Ds9RBUjp0wFa6ZpDPAwIcR+ZXsUe4UU9ccLzESUhdjW
	N3L4+yU+LcFC2zjoC2ccH840XAJFMlLPLfYEswBKIVW6zFEmbgl+RbrI
X-Gm-Gg: AYBFou0HAa8HzE+VPvzL3g/CbVtcCzBz6zZ9do18tsY4Yn9OWTeuylYYgJfyZbilBS0
	ytGJkUBKWcSsYhnIrhgTTfkFfiCqIELYaxiiX+yoV7F754kKSaoOQwS+rtT0ucrjm4MFIxEiKpi
	NOGBeJlNFPfMxA18IpOaF7OOVP8MNPIJb22md2B4Imn8J7Q9gURK3/jsrOphk1uWUwoqm9hPt7Z
	YTGRqPlz2U7cR8QYF3/QWo7x8lvRTyNvZxpK5uCFWEWo6OEG46vmwluMP8kov7s8AnmC9bEWteU
	2ezywQivKSESeMpyKDA7LgebGR6JGUCeu0dp+E19MXn0JN1ZlJNmYjbwoeyZ7q9sKLzash6wzyp
	3fUCmoJqfcbn2WSOuRgdIwnIW/vZsUnYbsJ9aARsOEKVctuktWyZicC34FLa0syd7kz/Q1CKuMh
	PfBL4rLdraYyfG8lguRoAsCZzLvEEw6Pb9rjgdErqHs/9VMxsyymISPhX+Wc+emv0990jSH+7ld
	hu/B01Be6bfO37XzXs3kxHMB5CcZRNhgtQmfFHODFVorpcNvqWN+xHBkfV4+hxOLgig7mjmnHhN
	2FUAS0m3AxD/B1QawHjIV9KY2bc7s5jjG7fWBJcL
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr94748195e9.11.1795202497703;
        Fri, 20 Nov 2026 11:21:37 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:37 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:55 +0300
Subject: [PATCH 6/6] ARM: dts: zte: Declare the HSIC controller node
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-6-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ShJdMtJccnJuS9VlQL1+Bdgxlkv6uh6Giop1oqviKs0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2XBrdRPG9C3eFKyU7PnA49Uabdls/WYzMcO
 WkzRMyqm46JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK5Iw//cCN+OqmdHZIesFYbXSmmMdBzwCEi/5E
 A++ezMAgQAwIgDawlimHqrPh8v7KOZ21+gTKfEh7ncmonS3duzqqXvwBNE0ZWZJLuI6VB8oQrxR
 Spms7VnDkKnCWCJY9lwTNTZHiR06DLnlF+2DrauSlWa/6nEsPpIeO5t7IjWkdMC82Nx45kt2kTi
 CRIMWib3xl/OUol5GZ0JplSVHjEeawQNpdTHI9+iaGClORXVFFm6BL5FN+h7/OCFmRt7iqFhrg7
 3637vNdQgvX0WkYq1tg/tCsBt70ZDMbsgxdrD88lrKg1DvkCToKB5r5+KK2TlKEXAz8P1c6z/ug
 4R8tFWrCZxsZkzFTb1a8eLWVt8/3dI99n+163gd1Zu+4t3/AksqtGaMDgXA5ERJ2shUqZhFs/Xb
 q8G4njYOSnTSmqKoYENf/26Kw24xW/ttjqcWploIYjRp7vR82311DAoRXKTzhKZODzPbWYliMj4
 RJtZCS3ZazBCo84x1e5pyyQbQV+tcj8HuVm5jSfvIf2KqK6q7TvAYnooGaIrQo0Yu4LscP8xmwI
 ToFA0xXUfKHLdUVApN4c9tawezCexUY6fasofMNz7kToQ4wuTsKTm9NEFut8zjOFqv5m+xBpEAA
 Hrwn4mejfFyqzdQpJuSwZcy/rL9bARrA+TKCmztVmIi69bu2+A14=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is for documentation purposes. I have not seen any board yet that
actually connects anything to it. On newer boards it seems to be removed
entirely.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 2fc888b10006..56d6b46a8ed1 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -199,5 +199,24 @@ usb@1500000 {
 			phys = <&topcrm ZX297520V3_USB_PHY>;
 			phy-names = "usb2-phy";
 		};
+
+		/* The HSIC controller exists primarily on older hardware, but I haven't seen any
+		 * device that is actually connected to it on any board.
+		 */
+		usb@1600000 {
+			compatible = "snps,dwc2";
+			reg = <0x01600000 0x40000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topcrm ZX297520V3_HSIC_WCLK>, <&topcrm ZX297520V3_HSIC_PCLK>;
+			clock-names = "otg", "utmi";
+			dr_mode = "host";
+			resets = <&topcrm ZX297520V3_HSIC_RESET>;
+			reset-names = "dwc2";
+			power-domains = <&socsys ZX297520V3_PD_USB>;
+			phys = <&topcrm ZX297520V3_HSIC_PHY>;
+			phy-names = "usb2-phy";
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.56.1

