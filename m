Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF364C9E19;
	Fri,  9 Oct 2026 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544985; cv=none; b=Kp80dlxSz9WrjSxJvlkV+ZaieQ79lVfVpmaJFoWLY8bYH2l+V8uxY/nvWVuJawXvgTo3z7+SvFf8M6OUXmlZVsH8MtCy6aOyxDvndqOaOvkaqd9zNBJhk4Rxh+08y4sedAIQyYncTVMJLBZnDBDAPXEqE5yz7sv+YSPKRiOH/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544985; c=relaxed/simple;
	bh=/KNZkyv5Z00YkmnO8i7WhX2uJC8dA9oSFJ34Gbzh0Xg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d+MOYdrqe7J73258eJeq+SJBj5nPwADBXOefiv/N2jUibO0eQYizT0mmYkMhPtsUn7eyJzXMo4TS1xzEn6jJebV1YHHsjVL8kOeMiqn9Crxvg74p+L2Sz/Sbapznl/+okJGOoqvloAdXy6I0fZHZR94xsyq1ZuFZi7u8flVzm2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wd85vwVv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wd85vwVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0511F000FF;
	Fri,  9 Oct 2026 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791544978;
	bh=/KNZkyv5Z00YkmnO8i7WhX2uJC8dA9oSFJ34Gbzh0Xg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wd85vwVv1fMXCqYaBLsPb1NVONgroCYys0DjzpoVf/YAMrp0PLzdEKOVyB43nl8lb
	 GpT8ANdLa4vkIAkcSYCzGyUa0aFIb6pqpGC9e0WTkhDjmRJSv0mWyLwe3+aukD/Z93
	 6FaUv4+n5w/5ayn4LNnAFHlwcHmk1oVne5nOIUNds6VbZ17ySxd9L4glu2l5v3HFpQ
	 bNV0sI8bdfXaKLrrMXHAsV2zYUWkK7wvwybaPPsc2ZW72Se9l1LAqvR0yDJSD3ETpw
	 8g6y04mPEfi3sU2YcKnRWmssS2dxMZO+LvPJYaatvjGww5tJA6pV21l0ERiAoMJtAZ
	 /+LfNiygJlYbw==
Message-ID: <sashiko-outbox-165362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK
 DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261009-cv75-soc-v1-3-808330e93ff1@ambarella.com>
References: <20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com>
 <20261009-cv75-soc-v1-3-808330e93ff1@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:22:57 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: missing dt-bindings header ambarella,cv75-rct.h causes devic=
e tree build failure
--

commit a2925973f53816ca6808a0857931c68399b1d569
Author: Long Zhao <longzhao@ambarella.com>

arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT

This commit enables the ARCH_AMBARELLA configuration and adds a minimal
CV75 SoC and EVK device tree for console bring-up.

> diff --git a/arch/arm64/boot/dts/ambarella/cv75.dtsi b/arch/arm64/boot/dt=
s/ambarella/cv75.dtsi
> new file mode 100644
> index 0000000000000..c36b6af48237a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ambarella/cv75.dtsi
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Ambarella CV75 SoC
> + *
> + * Boot peripheral: UART0 console.
> + * Clocks: a single ambarella,cv75-rct provider.
> + */
> +
> +#include <dt-bindings/clock/ambarella,cv75-rct.h>

[Severity: Low]
Does this patch rely on a missing header file? The included header
dt-bindings/clock/ambarella,cv75-rct.h does not appear to be present in the
current tree or in this patch.

If a build is attempted with CONFIG_ARCH_AMBARELLA enabled, will it fail
with a fatal C preprocessor error since it cannot find this file to
evaluate CV75_GCLK_UART0 and CV75_GCLK_APB?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-cv75-soc-v=
1-0-808330e93ff1@ambarella.com?part=3D3
