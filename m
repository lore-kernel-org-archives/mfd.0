Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1301833710F;
	Sun,  2 Aug 2026 20:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785703360; cv=none; b=ZacrD3E4tdUWYbH2P1f20Rqumwr1ASHDFwK18q9YU5nI+1VmiTViTvV5fW2hxq2UR9ivvGaO6UQO29IO31Rhk7NHDOG1kWOYUIdfrDDLDIm6O/YIO6tS7iB2M620xxzIeSwCPyRapoSwUlMu8jHnOCDkEyo8WvrXgur0wn3hln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785703360; c=relaxed/simple;
	bh=5YgYYc6lUdl9Xt/+WN5FscYRGQ8vk1sxomZo/JTUPzs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lc1hjrisbJmnHEHjGv13bhH3ENEfjCy8QMXWueHqZyXbU+TT38uZK+tll5/Zf13Ob09y90Mmwph+IuUrAAjXV96mItZ7wmXbak8f+BiUqVtxqQd9t3SbE5BnlGHSESX8qctSTBp6T0T1ESOL/JOraX7/lZLnnZPBrGZLbC+z+yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhFM6tLi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhFM6tLi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEB51F000E9;
	Sun,  2 Aug 2026 20:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785703358;
	bh=Yzb1IUVtrW/BYGvbNYqw8sM94sCUSt7uUetrixeRpLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AhFM6tLiYWx3M/zhtNlbl0Klo2wDddDOAnv7z8gd4n1EGUC0bY3IEK2PQXYP7iwZ4
	 TLdzu93kvGQciUYohuXIRKRdjcrDPjINzjc0J38U8XgPa821GYyde9Z7ynZLBVUpVk
	 QWDDDLXhPfm/7EAtZnjuSBEx8rECc3p364trFPWjGKb4qw+lf3jW8TOC5a9xsYEgU0
	 +vAgf83P6nJoOXuteK7+9ZUVFYpHQiftsxiCCbONw9Yiwmu9KRr1ZAQjYD/9gOqEQd
	 QKwrLPw0Y9QtfSPYesl3bqKhikiqCYZw/N+e6Jv3fN8tGtFQVQxP1cBpQkj/zIcLY2
	 VW0cWgWwkjO+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org, mfd@lists.linux.dev, lee@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260802-zx29clk-v9-2-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-2-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 20:42:37 +0000
Message-Id: <20260802204238.1AEB51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Overlapping macro definitions in shared dt-bindings headers crea=
te a naming collision risk.
--

--- Patch [2]: [PATCH v9 02/12] dt-bindings: clk: zte: Add zx297520v3 matri=
x clock and reset controller ---
commit 504f3c5393f4a8144508453d38c306eb0f25c3f4
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller

This commit adds device tree bindings for the zx297520v3 matrix clock and
reset controller. It introduces new macros for clocks and resets in the
existing zte,zx297520v3 headers to support the matrixcrm block.

> diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-=
bindings/clock/zte,zx297520v3-clk.h
> index 3aed94ccc26fe..a8477e9b2a149 100644
> --- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
> +++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
> @@ -63,4 +63,45 @@
>  #define ZX297520V3_HSIC_WCLK			54
>  #define ZX297520V3_HSIC_PCLK			55
> =20
> +#define ZX297520V3_SYS_TIMER_WCLK		0
> +#define ZX297520V3_CPU_WCLK			1

[Severity: Medium]
Could this naming convention lead to silent misconfigurations in device tre=
es?

These new matrixcrm macros share the exact same ZX297520V3_ prefix as the
existing topcrm macros in this header, and their indices start over at 0.

Since both sets of macros resolve to valid integers within the same namespa=
ce,
accidentally referencing a topcrm macro instead of a matrixcrm macro in a
device tree will not trigger a compiler error, making hardware misconfigura=
tions
difficult to debug.

[ ... ]

> diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/d=
t-bindings/reset/zte,zx297520v3-reset.h
> index f60aaccf0f4d7..d79fa601afa68 100644
> --- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
> +++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
> @@ -27,4 +27,16 @@
>  #define ZX297520V3_USB_RESET			18
>  #define ZX297520V3_HSIC_RESET			19
> =20
> +#define ZX297520V3_CPU_RESET			0
> +#define ZX297520V3_DDR_CTRL_RESET		1

[Severity: Medium]
Does this carry the same namespace collision risk as the clock macros above?

Since the matrixcrm reset indices also start at 0 and use the identical
ZX297520V3_ prefix as the existing topcrm reset definitions, there is no bu=
ilt-in
protection against mixing them up when writing the device tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D2
