Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202499;
	b=ZRKwtzCg18jnkrbwcev54xRDM96Z4Ve+1cABDkpYvS2Y5NfY2cdL8VK7VbW6cMWPc/sP
	 Kk+W7TGk2YsbftbEzqgUoLDHVh4Jvv0qe4rXckZLKgZYOrUPIBwiKy+PafyWONBTq9p39
	 97TH7VxP5sEELf5PiiKZx14F2154TIfvNz1q5Ze1cT/N+wnccA52+YCNiu8GYn8BqvvoW
	 3S1PXF7MzbEIf6krKW74yemdOGWz7je0qlDBG5uE4ksn5+1QvpcqNFAWvrPBPahyswIYY
	 /3yCsSmx4Ey2HyNc1o2JEN3S8k4fuqBUWddUnVo9DBxKGdgb5jRF11Z2u0h444m49Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bBmqP69mry+lGbki19N79NWmhaQ/6EL+J2EA0Ie++Zo=;
	b=kGyJt3a/meHScZJmGa0K7yDe0PIsr2WgARVq8g6Cw2338jvVFisKx1SshtNaLODn/t8h
	 bqg6gGSMTjqpKvBPUtjJNEI6X/f7YymFdNfFvMdjumG9M0JqmwwrOtEVWArvJPrpIgr3L
	 vMcFyDNDSSbctOXefEWXUdq6Q4H2HzHzXXdmEQAyFX74HKBaP2Gph/USvW9K8YqkftGXN
	 edcHog+gNXp09EqEvzksdU/wigxfOV9fTkWaZuIxNYwiUU9RfX+XOCY2s8xUtEgnigC8T
	 WpioU6PdKrfTzIImUxfeO+cSD/rIBtdVe3GevJcjMHtLq9eLEIkRtgaXk7WyBpSQtlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRAXCcWw;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3F60A2605
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 19:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C3F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRAXCcWw
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-497614c95f0so810204f8f.1
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 11:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202493; x=1795807293; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBmqP69mry+lGbki19N79NWmhaQ/6EL+J2EA0Ie++Zo=;
        b=VRAXCcWwV1Lyy6cNGaml7PJjvlLA8fNqbnAm7K+ujVFTAOT3einaxuPbn79x8LQ18+
         31aL3W0bWGjlbhkvKSRFlaPk0NFD0FHKfC1k5gA4qb1FJBSESMCkiiEk8YSnhYVJypNV
         pj89xcuQhxKWAJiVrMuyw7zg1ZDXQz8VS6gG0Qmj3Uo/7CYV8tGfIvFPPNMx/Mv7giVe
         OjQsKp3MgGW84z1PsiTinX3gkoi77Atcuzuzhz5vQunP5mR6va0NN6xsAcgptyjD1Fvt
         BadOY90xtbnGh3TmGvSsWOcjHSSqx9MIa0tMe0B25FJT69jvXXOhMUN9OaROvvsXTTNM
         cC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202493; x=1795807293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBmqP69mry+lGbki19N79NWmhaQ/6EL+J2EA0Ie++Zo=;
        b=QgAuV4fZ8KnnaljPoNQRlF6kjtXGvZMazEm6RpLCPruahku8h9BwEayvQ//9lOLnHh
         RbP5gctqGBi0kHsPh3DcaVNeX4BcElLEHORtnq5yCDOSP2vaDTBZXXilP9DVsbHNUJ6U
         fVjI51YtOWsGWX328YmAX6bLXrFdj0qfgJb1pPot188JbldbVu09kj+HrYMOkC6URxJV
         Pit2DDoQrJR0GvVaJNCG51+y5ACvmDnZw9Ae1aL58uBslWR8PKCBW/jmLN4m11dERICa
         8wghGDLtvazxVX9P8fU7SMx6yK/aHDej+6D5feUsTX2VErqhLK21mXkpXFDZMVS7q5GM
         ur9w==
X-Forwarded-Encrypted: i=1; AL+hErHHmb/OaZb+E3j4wh0gyowtiveLb2Z+4Ga4MmRJbbkhh6dTz282YrOV2tD8r35N1Bm5NA8=@lists.linux.dev
X-Gm-Message-State: APuU4Z82pzw6iDLtAtCjRxgPFm5paaI+ZDQjBN1n3szdn5Zq4kyrnKXu
	LovycsynauJa47FSax9f9Y8D3swu2tmUEyzDHK/m5I9Os/Z9hNPc71i5
X-Gm-Gg: AZFdTZdZkj6GPESvfi+e+GuRq3dDqpOKdfySugF5u2w5MIN+TasJNiS0cv7+omv8eBP
	EAPR5yiZPC0sqkjjg6XMo0wHo3eznlSi/6J6XQXPkXiMP/m5gynaMn/J0bPOLKModQa9CXU5PCk
	3yNOtML99XGylmKJTe64FkHtbnV7BS6NyXIU4xCXZf1asiurl6UKPlp96Diw/5PhFfzm+m32Jpc
	dnUYVA2W4YdtAu3PGIxJ6QhLkbOhmbqHdtWk+/K4rhpXRYYL9lXP8WNbzWLVk3/hbqWGis9ekup
	NfWW7hsbWRIk6yLuDezYrc0aEi+V2WLYmWqeOUG0M2nt/MRVrqEIINjElzgLsLujlNd3pZPYaI1
	EfY+mVNoNbDEIljVC7jTNfb4yQArbjEB2X3pMeJ6Ym1spodsGFPl/OZlGiaNw48lOdf0Xsvhs0r
	ofQCHVIK2LteiwG2lGJhhN19wjnB/LHQrkgr8kVW2D/TTwNJ7VouUw8F1CpKjMlS8u+U+NAAlv1
	FekEW5OXPstpHOfDYChlmH/gLH5wXjF0xkEDqKDwkR/sBiWcuz0ACcuE1ZerZRlsSA2dxAn4m6G
	fn7Y6aoVmcXsMpPrmSwUTn7INEXXLUHUkzU9NG5lVw==
X-Received: by 2002:a05:6000:4812:b0:491:a219:8506 with SMTP id ffacd0b85a97d-4abb55183dbmr8227192f8f.48.1795202493000;
        Fri, 20 Nov 2026 11:21:33 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:32 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:54 +0300
Subject: [PATCH 5/6] ARM: dts: zte: Declare nodes to enable the board's
 dwc2 controller
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
Message-Id: <20261120-zx29usb-v1-5-b0433258e51b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=VM93HH2t+Y1jF4XnpLTskujk8HKKI0SNwO3Nkis00qQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2XsdE4XtHXB32BoPfUssqGek5Snakxjcygb
 ymjgroPEw2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKGoA/+Jg//JNfc0k8TCoWlB57VTEUolY5k3Cb
 /BrSS9BX50YVGu/+HzfpBKoj+zDVoYQYMR7YMv3QDqnLEU+zqcZFaXyh476zzi72itSOU4kGTtj
 +9SgKtUdCm9bxN8rdctWmeWLqbXPrcrpQiTk2ZL61TLT0AGOki56beImFwuqbro8vkjpAV8Lr1a
 lSYW04G/FKMIVyuygKvLKGhZ+Mu/RRYRMvtFuPJ4E0XeRJ7JbwR4g0yjpiAhyybMRWetDuHwJoX
 UASgZ7aaIcGMMm7ajBQ/9Iy/r3MxVZNdRk0P4lncHRPXhQuYxo5/LA92VPadtxDJcuBppv6hBar
 aUDxcmjqvs/zZlTHMMQxcHKoqI7tdfmYUx7ziw4WSIDgmSf8myzoZq00XAGfhpf9BAP3ObuDTQg
 R0xumTXxnByaAMo9QJH8ZzLGg6xl6ZdP405AeqkNreNOCBOZxMOcTIomfdZsSo6Dg02Oqu4W+fO
 onN/KsBNwl/BPAny3WdPYb8Fp5GmIbqLvqxXfCqwfi8TveidunVclh+TDa+nb4eSQsf5tncF94t
 c7FQEK65ldHG9HnblB6KbWI42xu02XXFa88SwSd1qspzIKrbBji6lNs+6Yyp27DZLOPb9mJqVll
 NYFWkTtipcDBCYyRbXgSu5TnxIFdOcZePEEYjNqtlJEwn1S+kLzQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This adds the socsys syscon that provides the power control for the
controller and the dwc2 controller itself.

On all boards I have seen so far the USB connector can only operate in
peripheral mode - including one device that actually has a USB A
connector. DWC2 and the PHY can be programmed into host mode, but there
is no VBUS power supply.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index ebac3cd137df..2fc888b10006 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -5,6 +5,8 @@
 
 #include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
+#include <dt-bindings/power/zte,zx297520v3-socsys.h>
 #include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
 / {
@@ -111,6 +113,13 @@ reboot {
 			};
 		};
 
+		socsys: syscon@140000 {
+			compatible = "zte,zx297520v3-socsys", "syscon";
+			reg = <0x00140000 0x400>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		matrixcrm: clock-controller@1306000 {
 			compatible = "zte,zx297520v3-matrixcrm";
 			reg = <0x01306000 0x400>;
@@ -176,5 +185,19 @@ uart2: serial@140d000 {
 
 			status = "disabled";
 		};
+
+		usb@1500000 {
+			compatible = "snps,dwc2";
+			reg = <0x01500000 0x40000>;
+			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topcrm ZX297520V3_USB_WCLK>, <&topcrm ZX297520V3_USB_PCLK>;
+			clock-names = "otg", "utmi";
+			dr_mode = "peripheral";
+			resets = <&topcrm ZX297520V3_USB_RESET>;
+			reset-names = "dwc2";
+			power-domains = <&socsys ZX297520V3_PD_USB>;
+			phys = <&topcrm ZX297520V3_USB_PHY>;
+			phy-names = "usb2-phy";
+		};
 	};
 };

-- 
2.56.1

