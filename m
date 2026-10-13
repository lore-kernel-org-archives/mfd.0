Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A328E18DB1F
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874080; cv=none; b=Ufr5qQSZdv2jF01RonNFQkhnLN/whEt5hA0ZZOQBB+OCgQ4w4rvmWNHtHIJtD0FBTch18JQ/dl/x46gqLXucn0wN+6d/yB1nfohDXbcKt0GdBB7FdK9TUuJqkHIjcRN7WrrraDnWExhZLgljP8jZi37YSq4BSYgyjkVjZeZlr9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874080; c=relaxed/simple;
	bh=wEpsaWwwUany5rJ9zud1zaqpXDh8EPeAA+9ZvMJ6VEw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DdADOhdf0B3V4uEDU9Utk3F1sFRwgUjKqK1BmJ3Y2v9nwQMf5LzRZvHBdZj0kF3IHuAkgcp65RV1C+iInngR6S7i0/VxZO8V/TRQkt3jZpATaJng78wdJoD4Nr+xj0Wai78VoHc96x9mcC94ylqERcyDqKEjN2KZXqYaLgFYyk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOmJYkt9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOmJYkt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C321F000FF;
	Tue, 13 Oct 2026 06:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791874079;
	bh=wEpsaWwwUany5rJ9zud1zaqpXDh8EPeAA+9ZvMJ6VEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TOmJYkt9KwGVpZSnMOcOmiAg8ob3UueRbaEZvr2JqqXjv1U0ySVhs/56roMHHAUIH
	 RNB9uPPIkvSYOUUhvCrsjZ4SFbFIW+gUTMp6uwg7rjV9ra0guVMmhaRkHsPqS2CTIM
	 YFIZEpFOWV/pJm24EIA/vhlLK7+jlJhOeECHdqRO2wsYmaRNAypbXtMTI8CdC9aEfm
	 Cd2sY/6PUj7KUB3GXVtpizOAXJPEIY6786ibmyt8kFIysBzEdF0yAghJpP64Mhm69E
	 qRVKHXQWLKWebzvEQBqkikvrNb/07lPo1DwTgYQh65MSZqDWf6N993d06T1r3FhuQ7
	 3c06bnjPxhU5g==
Message-ID: <sashiko-outbox-169131@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 11/12] mfd: nct6694: Add a Kconfig symbol for the USB
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-12-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-12-a0282524688@gmail.com>
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
> Now that the sub-device drivers only access the device through regmap,
> the core no longer depends on USB.
>=20
> Build the USB transport under a new MFD_NCT6694_USB symbol and keep
> MFD_NCT6694 for the core. MFD_NCT6694_USB defaults to MFD_NCT6694 so
> that existing configurations keep the USB transport enabled.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D11

