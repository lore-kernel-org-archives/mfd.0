Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49B345A2A2
	for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 10:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049116; cv=none; b=eBMR3J6fbrid251R5Ieiujg49eW86vuwS9xL9eK8DY+Bp6QWsAVNX2hAJvPuqpKGSNZVzl2dTASRJszTh6RBapxS52PmFJsQzztURUQFsW0PPupo6HvRezkktO2T/lAaa0wSu7dRFZ8kPJcRdY2yjsNECp+v3jjlorUC7yHRRkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049116; c=relaxed/simple;
	bh=JlXervBrap08oWjRy8YgJzXZgsiOFuEaToTks1m1ZUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6kth1SdxMcf3aotxVpfEfTWoc+0rHCUKKbT9TKtTGqNK42byAYe59HoDoCZIRi1Q1Q/h4i3J1dB/EDI2l9L/8vwYREIL5REY8lEr1UrW4Kvd56vZfNBzt3/beMuC72G2H6mu7K5lRGoP+HFe7BrC49aCiPP82xMWYR2Lv/qOko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=E4HZmmqw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="E4HZmmqw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49802c418b5so48114585e9.1
        for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049113; x=1787653913; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shnIdCEg5h/jv9ES3TNBugMx2+hKBHKqFcN0Zurfu98=;
        b=E4HZmmqw8ICZO2JXHiLXctPyg+N/c/vHO6HefMVw+gKRLR7MVMO6ROLHCacZMUb0wl
         roiElx0tJYPqCeuZoChAzrATvQdmu+misfvL3WmevMQ40Im+eJ3wwN+KAYKmgAhw2+X0
         MMbjZ6TKx9WCKQew0yIf/P2jVr8gXtzN1wNISuXCoMdI2G0QIf22cHn3hHbCcXPL4UsI
         zeLlgpJ2sVt8BYVc0gcAq96E4c3VzKied9sJJzduI3JNU3jW7o/K+HZZwECuG+M9QhEq
         JCjw5VWr5KrnsSq2PhXGQVLN3xHaHn83cudHX/I7J3hnB0xWjMZmtIQf5KnPtU2egBSy
         Cv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049113; x=1787653913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shnIdCEg5h/jv9ES3TNBugMx2+hKBHKqFcN0Zurfu98=;
        b=JwS4WNOGupanf7sJYQQKsWimOO2PJ0p6FBRgGFuAQ63HOCDdanbx9Qtv0HV9JosKwI
         yRS171IbzjuQtvRDsCAsNsfuy87/XIZRDGQf1cvNcIYcZKh69BSE5V6e0f2BsjKmw9Yz
         S2oCzJ5mS5V+GvUMsQlMYEXgtybapdDHCYEBJ/TNKzlMngjtC2yQQaAUiRik3CntGBI/
         aJ7SC+YtHiOpJHKZ4uOBJaFqV74CKCP4rG4gLcNWxzPHxwYVmLgcXSNZwmvkp+Unq4pp
         Uk/L3tM44bm7t7Citk0N75ccLjCgnZ5enM84atT6DK5G0hD1Vs58GVG9TP3ZRiVTQS1M
         FeHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxcN2m4xJlRSXMnVM0ziEjBqrCwEi5+JR4V2PHev7ipz6wIdy7wTlobzzohvF47/MFFD0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwAMgT6TKq+HtAQBW/KwTQl5717WPytba9lW4m4DesEqqr8dsB
	j9wc7s6KjdGVdevjaT/HeRaA9SCf0NJaeoD+yK/llrOQoaiAQ4VPxWUupbGM0lVpQj0=
X-Gm-Gg: AR+sD11xpP8mOs8icXd6S4XCTAWU3ZmeFOasCdRdRmOF4/H6ieZ3GOwsTaMdizR5A8k
	AMBccoHERKOmQwSlhVhxNAvWhQE2D/x1CCeWXtGt9CVIa4EaEHHyU8kC/ruxzFnpm5qxZHlTd+m
	7mN9rw3glFn+SPirYN7pZmeB+Tr4d69etl/Hrqs/Li4El3hhhvFI3o/WVkHiPEgGd8QQfsahq5B
	xK/4jB1oBrCmpTGschruCK6fOGy6iRR96lZfKO42qf+d+YSYckwPJ1bUm7D0V/hQA4Sh5OFh353
	te8GxRfgYfou8zmwIvQ/31JfnVGJ9vBj3rE4eMk+Of78Kk61/hHxrTEB/VEg2Tq3E+IH13BOtOs
	PBRYbDt7WW6/95QKgEtsjKUZl+lDTFs3xrkQW0j2MDiHvJS3mZq/OwRuY7vov1Z/ZQ5p6Z4Y4IP
	UlKuUIDwR79pznXjA106a5x3kQAOPC6+Ugujzs3v8R7nRC0tu6xYgyH6PfjUqP7sBV37lq30+8v
	MTLCym58rJsoULC3lOTdVIGNFBo6sA+aUDo3j/6wvQJtJLhCc+jJNDQ/drs
X-Received: by 2002:a05:600c:12d3:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49987980889mr317588565e9.10.1787049113006;
        Tue, 18 Aug 2026 03:31:53 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:52 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:19 +0000
Subject: [PATCH v6 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2

The VUART 3 and 4 are VUART over PCI.
Set this flag to indicate this information.
Also set the scu-syscon phandle.

Added lines are compliant with dt-style strict mode

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index c952e2075b4c..61cdca0b3ed7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -723,6 +723,9 @@ vuart3: serial@1e787800 {
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
 				no-loopback-test;
+				aspeed,scu-syscon = <&syscon>;
+				aspeed,vuart-over-pci;
+
 				status = "disabled";
 			};
 
@@ -743,6 +746,9 @@ vuart4: serial@1e788800 {
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
 				no-loopback-test;
+				aspeed,scu-syscon = <&syscon>;
+				aspeed,vuart-over-pci;
+
 				status = "disabled";
 			};
 

-- 
2.54.0

