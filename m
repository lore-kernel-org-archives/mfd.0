Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B23AB272
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874081; cv=none; b=KGczYEy3OjnslzmEqXFIdV//J1jA6s05QyNwr62DzaNbZmr62OjzniUFD+MbW7jOcS3rGgPjCdMpOj1ns55NiOL23iM2lIN2VBp1Wk+sW0KeqxXhBNIxIXh3ydUvMGp+31KIjzic8mXp/g+SzbX7iUyFjG092jCaMKUVvEvMSzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874081; c=relaxed/simple;
	bh=wD9GmvaczTpEvVlKBa6KyqpENUNzMhcdBrAvx+J+AsU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZO+srQ4eBRIoP4BCNtkLVm9GBUA7qLmwTiyrX9HeTxK1b0ikCXHWaAOPCtgbSXk0UpakKWlgH5Wuic9KeV23AlefOzjyts0NsamQKI/ILwwNELYi3yKGIiJgj5zSoUKQhVG7mYpZODPYZlHGwMJ1GcaVqzYHl+6OV1UaCP51ook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=behGZJi5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="behGZJi5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F35A1F00893;
	Tue, 13 Oct 2026 06:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791874080;
	bh=wD9GmvaczTpEvVlKBa6KyqpENUNzMhcdBrAvx+J+AsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=behGZJi5AhG1OvGVni2TCtWOwnPCWmm/l7egcD4PnIq7V8ZvRJjKKgcA809PwxeJO
	 BtcRXZUeXND/W9Mc/NnkvuANEqo+vmqKiqmR6gO2F7BERhGNMfcZ/ukiFfB8mug4Yi
	 7ME6F1Gtg4AaLco8GSTIWJ0Wtdukym+vA0bNC0M6ovsc0p5A5jMtJQGc8dM3/3izbR
	 fe4fSTFmegFDM92Zpu6OYZuquHbfchJ/nKOgwDErB9bLD7/zbYCt6gjKrToHWptzLo
	 lHynWj1UOhZ45O68VIQ5PaRbZBt6zMnud/rfWTCp4O7zRbMIctgtC7gwq5vYvwYSMw
	 ynZlbDQeqzJ8g==
Message-ID: <sashiko-outbox-169132@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/12] mfd: nct6694: Rename driver to nct6694-usb
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-9-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-9-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:47:59 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Rename nct6694.c to nct6694-usb.c to reflect that it implements the
> USB transport, in preparation for the core and HIF transport added in
> later patches. The module is renamed to nct6694-usb accordingly.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D8

