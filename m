Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5BE37C0F6;
	Sat, 10 Oct 2026 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648698; cv=none; b=QvUVAspnj0+GI9eUE/wmqus/+YGY1LiyBR5/OF+p1mcWRZ5Q+3gIKMqr+vMBtdvnPkIxeILBNL/Hs7utHJJoi68J+Kqkh9yMkDHAPpqngAmI0D8CM744jOj/prL5i7X9HY8HNtLMnE3qsS0ou/K0acxJoqCxPwnKlzHQDF1scIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648698; c=relaxed/simple;
	bh=ANwcz4nZX9+2ZxtzQb/am3nwo+Gub7xF9aMik/WjgXs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mR0qseUgGz7pny1P/lMybowEc2KoncC8j34BmLk1O4/BfSf2sfjReXBqH6c87XHI0Wf7Cu9y+xge7oGZs0Zs5zbC/nNcYAcFERSToQbeEzSJcSB6F08dmV9g5nFYIR2LILFqeRFyymFx2A4lQXwNNeT+oRekeXhDb6gottZsLdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTiD8BkA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTiD8BkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392141F00893;
	Sat, 10 Oct 2026 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791648697;
	bh=ANwcz4nZX9+2ZxtzQb/am3nwo+Gub7xF9aMik/WjgXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aTiD8BkARMo67Hxp71eXHziSV1T0inQvnxbMrC5f/usVo57kvFLppzYmchBC7CaO1
	 gQHVOUQx0gxqzTbyFOW2DDAC1FYtJQj/nLGgABOY0igoIPPZWbqo4KKoB+Awx58zxB
	 178QDykgp/4vlbxWVahWqsJLZRc7KcnpZkbeCb9+Wza0i3UfMzzmSogymQcYHuKh+c
	 G/giFVoHcezq61/l54+Lq//0K7yz23DU09RXib5mXDJhoT1jVPt6DgK+czvlW72bc4
	 vXtKFR+sBdXZix5J8Xy3foB5MgZ3WFaGqEO+/xxdB+Bp5Y6cm2x3u8bTbuRCHNsb0c
	 fbhIWIjBE1NQg==
Message-ID: <sashiko-outbox-166717@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 01/10] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009161102.38961-2-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:11:36 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for Airoha AN8855 5-port Gigabit Switch.
>=20
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configuring the PHY page.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009161102.3896=
1-1-ansuelsmth@gmail.com?part=3D1

