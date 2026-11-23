Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475297;
	b=BvFHFOt7Nzfyi/0Kg0q0/tEwEqsPYmGbQt7ZDOGf7WntrYVkgeLW6wWpPqiBeuXTCGnw
	 3b85AtHhZ08G+ofbwtxFUfVL56NrBDhtzrsy17Vby6jMyPjB97FEoznuG9W7fT32PAxwX
	 K6GxAlVit7YEQtEJk+Ye54TYtgshof/UM35CEZEzetyOjteXk7XMzk/kMar3gNzPTNWx/
	 wJtRdSVipsGKK+/7ZZjHUUP1QgelDUvkqB82uY4KuZxVtfj4np1vevLnvwkzOG4nwpS+M
	 GjM8dMfr20m8T1ZytS4NXyR1++rzrPF1Sb/YzvD2ZLCoeUEIsILtzAvYhTPuXFDYEWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475297;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2vVjZct7fxRHSY8WTT5j0WCzXWLL5vKHvxRxX+P01Sk=;
	b=ERzio7GJYN/r1BwHBJbEpspOI+9gQJahBDFpnsqMvrx9hDmIGQj5F43cIJwtGp6wcNwi
	 TiHOm2e+4bR4jy6CdcF+V5k3YYc/Lz3FvlhJICE3tgJ7xyWbug7mVJX9t2zUkH4sWhOc8
	 5N3ftsxjDVqfA45YZtT0KA3NT1frRWRWn2Ex49RsFXJ1Kmqglw2qFNsw36Avy5RXo5ldM
	 K47FS591WP5XyWWynRuz+iUR26/GktJxQp4LAM664FBYcje6ZzrblJ1abzqBIBTmqfer2
	 0lJniWnp8u2MJQoB8yAzdHJBya3HM2NzzMI/FPS34cY2jn+xjzxAdXEKMJX6PMPc3og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e4QfwSlm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF18606A321
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 23:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e4QfwSlm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E742A1F000C0;
	Mon, 23 Nov 2026 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795475297;
	bh=2vVjZct7fxRHSY8WTT5j0WCzXWLL5vKHvxRxX+P01Sk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e4QfwSlmLeGvMUzLjyFCSK0Ym2ROWKGA8tvSl5fmapuRp1QSqx3QatdC9Q64dJusY
	 maEcMB0TrfPkqlOYXSJULiav7oR/K0kl8Ip5orCkztiEzX/ZbOj7W3wx34IH7tPzoq
	 2RpgdUvBYOdR23sY/XfA/9LiBLk4rbqcukRFMCWmwxLmLRrasxDcZEWJmRigbRNKZN
	 Q2OHuhVf427mtqvJTkPDxSSukDmu+O8pEfijtOsTZbZ3VJyb3jeoTX0hIHtRYBTj08
	 0oqOVPHBBHwCJ4efaNXn6XtTSjA5LLvNF4S6dOKAM9ID0ZNGeygxWdDCmfPdMzUznw
	 sIl6R9ZlolhBg==
Message-ID: <sashiko-outbox-230183@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/4] ASoC: arizona: switch to generic device
 properties and clean up
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 23:08:16 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 4-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-arizona-as=
oc-v2-0-6323d3c0961a@gmail.com
