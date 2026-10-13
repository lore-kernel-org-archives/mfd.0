Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E23F4125
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874715; cv=none; b=pmMrB0jkJzXEp73Nw1SHXwZQxVsr7VSmUaiZ72/Enu1antl14zvD/Blj/78yxr8pFKi51l3HaGR6XuCDg/qv+JE0lfveYFs8CugCIFNqiif9gM1+JGMgCVVKqxJtPOQfUvDzudc2DleAhU9IH/fsgzxAB+7OWVDIlgo2m42xZHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874715; c=relaxed/simple;
	bh=fb95/ZRCmlK0lXZmT2vc8bHwi1J2W4t3elRiVfWIMbI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=goh8W//D6wmEKRn31j1jaghpUtqjXE1IDjjuytpAFDCdrFLm3lIaTUlv+xjUl9YrkKjxBvnnhdeDutkwjMp6Bzm3DoZzZEfqPIuYQfuN3K0++l72GqrWxMETJQ1oksfwgebRHfHo4Q0mvbClAWaVNE+FXu/5EpTQ0QKUjD/0ZtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F919v1UC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F919v1UC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA591F000FF;
	Tue, 13 Oct 2026 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791874713;
	bh=fb95/ZRCmlK0lXZmT2vc8bHwi1J2W4t3elRiVfWIMbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F919v1UCGoSUHmjQau6is1ZysBYB8Yc2DI+xmk95NUxLkXZgyyy0A6IMnvnVTpEGq
	 9H/OqGuxoxRxUDYcC3vNxe9QYHiCFy1ba1o7fxeZZaWtURzUwCTcXhYkoPVAoHl65c
	 fLIQeEQ/Trv1cjai8wXeJbeuuJ6ByVL/SH6kIegiXL/Au1n2KW0w9lYr4vVTJsl390
	 MJMBT1gP1GNJmLGkbgIbKv4naM+JQloHUClRcmjYdsvtmF+p7l8XJjvwUhU/x0zD6Z
	 NQ1qeUyudzh5w/dActQYuGOjoSBSkUYNQwK2Ws3Dl75LBVtMjqtxIig+3/b0fTOToD
	 22a+F9/5JAhhQ==
Message-ID: <sashiko-outbox-169151@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/12] mfd: nct6694: Introduce regmap-based transport
 abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-11-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-11-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:58:33 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Sub-device drivers call into the USB transport directly, so a second
> transport cannot be added without touching all of them.
>=20
> Wrap the transport behind a regmap bus. The command header is mapped
> onto a single 32-bit register by packing the host control byte, the
> module id and the 16-bit offset, so that the sub-device drivers can use
> the regmap bulk accessors. The access_lock is dropped as regmap already
> serialises the bus accesses. Transfers larger than the transport buffer
> are rejected, as the length field of the command header is 16 bits wide.
>=20
> Add nct6694_write_read_msg() for the commands that send a request and
> read the reply back in the same firmware message, and use it for the
> I2C deliver command.
>=20
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D10

