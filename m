Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8C4B95D2
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576292; cv=none; b=q4OjogyQpOBW1WeFiGBdhMzCLrHiFWDQ9hS7UPtPFWCsLSUoy55Iw8+nztxnOGHx4i3H/xOn8DwmyY7wLjxSt8AFvN/W3pIselS3vMUVgWKPAICdPMq2q/xrFeUdJ59q9ECtcNo5+i1mfzhKhq0JsqTAHBK4CVGk3DLvpSBV10g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576292; c=relaxed/simple;
	bh=zQdGw9LMkeSErzA78vw9tJYgFln9mKIr6RrbklMI7m4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NODchVGtugddsZbQdBcjHBxVeeyy4sSzN0v1EkkQ1XcZn7Cpoh/yEmmEW3TFRTODF5EejvOvcBaaDWeWPKiMk2OvRJl0/bPQeICYBQPx7lBOEH3fEUOt3JNDn+g74islut5+/X/lDESmG7X5OBHi+J/Dir+d9xbgX+QQVSDbhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfAAdJ0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfAAdJ0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3DC1F000FF;
	Wed, 16 Sep 2026 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576284;
	bh=zQdGw9LMkeSErzA78vw9tJYgFln9mKIr6RrbklMI7m4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cfAAdJ0C/loUujlNCxnTxw8QZQEJy1Fryz6p7sjHN6h/fF9Q31K0HoMwggrV2WTK5
	 FHBm/Nd5oPO4RKgBswQoY66yPKjAAO7apc3XEWZkCBpcBFu+W6nKhX8akDQLxIM5xE
	 f7i3oHA5Gke4d950PYMTK4H0uVwKtExFj7Ins3Y+hnF4VcGJgOv9dF/Y0fm4nPwESu
	 GE1JA2SsUeCS92BZb9TwtbI1QLfK4KTa+9Dus3pUYTlBKewzEdJUqKiM0E9IXd38MN
	 LWnOzUGZZoJ33Nz5Elzf9THBW//A3mwqq29SeC3TqAF3tRpVX72dTW+/ksuGYFKpC6
	 /XogZJzw123xQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/4] mfd: intel-lpss: Remove redundant DebugFS error
 check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260916-intel-lpss-debugfs-v7-1-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
 <20260916-intel-lpss-debugfs-v7-1-eb51d41f55e0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 16:31:23 +0000
Message-Id: <20260916163123.BF3DC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The DebugFS API is designed to handle errors gracefully.
> Any explicit checking on return values is considered an anti-pattern.
>=20
> This patch removes unnecessary error checking and converts
> intel_lpss_debugfs_add() into a void function.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-intel-lpss=
-debugfs-v7-0-eb51d41f55e0@gmail.com?part=3D1

