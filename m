Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256390;
	b=CscSkgmc4GJEK2Ucc9d89ViWB+xLp+mnt22egn1abGgsZrL27zPJB3i0VQqvafVhOP47
	 z7ziwKWHspM8Wm3vWWui/7HQJF5tCe6/0X6P39IPZtuc78Rn2QL2WZ39FONA8oyj7lw+Q
	 uzVDnFWbgsqt4GaumgDuetoJogUr44Ii+0LbDgt0BtpDTvfgPw7/CdmGmRf77y+7bea7d
	 rNeJLpR56ivIXkWt84RGICBuo8tqOd9cs3TlE1nEgfLzCV7dSHGwRwOGklPrOAv3G/NXK
	 l2Iq96stcR3NSavSdazz8V9n/bLpNxmE6WnPuII1dND8fR+Ji9IDjENLbsnG5m4usjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256390;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z7z1X6PBzohR9lCQdYg4JQj9jrpb1JTx6m0GJXWNJhM=;
	b=1egFJpKeqp+wNU2rc1NYUnAIq8z/IEWSrIiXS08lWYThvBrXLUCKnFCgejQKGqHIMuQB
	 kct9cRotTs0zqmKSqrrODqJ7SF669jhqYMctjAIt5dGVqRUEiYNnhQdD4SZ7LfF2Esqpj
	 EmA1a6C5LdgAPOOlG3ajhZhhqRd3RacIUBLm4wiAkNscgpJf3+LdZzyHYiQbDqnhGG6e6
	 CTOAr+aaQH+v8vqXEXRYvokPNHxJSB1EgXFfMvX+VTd5LwpluY2E+dcQlVHkI7OLhRtAu
	 5uBTvx2T83E5y1YeJ0hivq+eOp5bbvdIW5GiPK6v3tNEzs3x+U4/CMfHAnGN5ZwcCBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWEgweRj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9267606A320;
	Sat, 21 Nov 2026 10:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWEgweRj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3811F000C6;
	Sat, 21 Nov 2026 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795256389;
	bh=Z7z1X6PBzohR9lCQdYg4JQj9jrpb1JTx6m0GJXWNJhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GWEgweRjCac6rAxCep4naELem4ofK21GhMbarBgyGkwV0izSQYRrEme2fTj/eIPql
	 rPcoJuNLpjQRzQdUmkT+DMkiTitpvK6cMKHr6P8KxXSUyIT13lADINNfIoIczLW8gB
	 cHjH+Y+BHvelzUcl+EwjVWUCfi22nF0+gJ6Zlf1EAQ7tOalQEbzxsRyMjlrMZaP2I9
	 q3m7rhEIBYpHYHCg/SjiLrDPKv/l/Kuf8BNQG0HwtZe5SlXGAKc8co+YSPUl2AwL5l
	 tNR+5Pky29RHpqMtlMtfEKBp7v1ZSHUKTTtdr3KaJdwgI5fdlFEjLgrnY/xG0IAjlC
	 flPLt+4XSCRaQ==
Date: Sat, 21 Nov 2026 11:19:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vasilij Strassheim <v.strassheim@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	mfd@lists.linux.dev, Martin Kaistra <martin.kaistra@linutronix.de>, 
	Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: [PATCH net-next v5 4/9] dt-bindings: mfd: Add SoC-e SWIP parent
Message-ID: <20261121-lurking-bulky-crab-b9619f@quoll>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
 <20261120-devel-vstrassheim-soce-dsa-ml-v5-4-5de9225715e6@linutronix.de>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-4-5de9225715e6@linutronix.de>

On Fri, Nov 20, 2026 at 03:52:21PM +0100, Vasilij Strassheim wrote:
> +examples:
> +  - |
> +    ip-core@80020000 {
> +        compatible = "soce,swip";
> +        reg = <0x80020000 0x10000>;
> +        ranges = <0x0 0x80020000 0x10000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        ethernet-switch@0 {
> +            compatible = "soce,swip-switch-00-04-0c-10";
> +            reg = <0x0 0x10000>;

You have conflicting address spaces - this covers all other children -
which suggests this is artificial split of device nodes. Basically
comments from last version are valid. If some split of device nodes
makes your driver easier, it might be fine, but only under the
constraint of proper hardware representation. It's not proper hardware
representation anymore.

Best regards,
Krzysztof

