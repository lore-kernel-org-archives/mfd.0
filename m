Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430D339FCDC;
	Mon, 10 Aug 2026 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346076; cv=none; b=F16dQK6nPcjb1Gbkl9X47FRY3Nq2vYTy14uBty2dRj3vMFlPBTWa4igfQ4ICcbwHHWvjpa770AXEBbJidhHypto9JRV9kNUmOThfK3uqd50i5F9oOIAli4V34FzmmYQD1oS97r1UgDh1ePhsrz/FSk60NXslBJjRKVEMN+OAC3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346076; c=relaxed/simple;
	bh=6OTn8+yVpF8MULe5C69638LKQctt8U4SZZHZOoyVWOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k/t4WcLD8gG4Vpxua9tufBgni0sn9WbwTZls41EGfgmK54Kst9UxDibnBae0ZBO2jrKk3RQ0p2REWm3wvhQ49rpqs1+XiHZ8RMHBnojtI3fy/5ceBTui3GbwCJRaJR9+pvo8Qp22Hcno6HLVg5ecEphQprcDZgM0o82utzIL/sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDE83Osc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDE83Osc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564011F00A3A;
	Mon, 10 Aug 2026 07:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346074;
	bh=6OTn8+yVpF8MULe5C69638LKQctt8U4SZZHZOoyVWOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KDE83Osck3mrMqIkQgLzxLG/ugS5BoyLps6rH4W9h5449zoGM53084qDlNAHskQg5
	 1deRJbkHaaq3LXKJfaMRG/mGMqjiy8mtT6klqhqreLlCpDk2Ck1OkRr6esS2Xae7zQ
	 ifu3O63JRGIaJB7wRvOafW2qmdCE3cXx3FJ44HhsTTbUt0dkvm8knsZh+/XSJcEIy/
	 U2EwKY2MTQT4H3qwROH5MG1UNXAZBVDduZkAwRA7TNK7HEFIiSEeEk59CsQZ8JG7O4
	 WjqtjvxuOy5NNCSjMFLvOYe2+nXJVYY3P4ksFSTcRXWP4kR1R6OechmqhdjVKGKTly
	 WtI9VVg6x7btA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, lee@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810-zx29clk-v10-9-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-9-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:14:33 +0000
Message-Id: <20260810071434.564011F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
> Ethernet. The only non-clock, non-reset registers I have spotted here
> are hardware spinlocks.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D9

