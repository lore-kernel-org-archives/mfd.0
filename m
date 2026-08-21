Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F9934A78E
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787284323; cv=none; b=s+h2JqvmoBY9sToRlcipfpdBEz4uLVQcD4AS0mbPIo3cZE+EjisciGkLgJWi6xes7akAlbyUyUgVWCO5a9lTXcmFd+0BIFl7flWZXmy9eh8Sl2sL/qUbV7dVavj+9PZ6KUxynxmDxLOvFr8WEvlmzidrUDLa1Cudz7miCuAdUSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787284323; c=relaxed/simple;
	bh=ib4lifFKvSYSy8Pl1r9D9dMsTKl1e3npRyP7jzu7B1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jbTvaOpe2AUYfGMSJF0taM5tlWMe/nl2VJ8RHseB1T/b0263IXHS8FCMZ5m5ppF3nHfAG0PusasSvnBoUIJHc9FT1jGOWFxOeNGvRI02JCISgUDnbC7lz+ihplFOx9h3IinhKQvLkXscC7daI37IHOgpvwimhJfk78j1IqWPkgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8t54SED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8t54SED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A6F1F000E9;
	Fri, 21 Aug 2026 03:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787284322;
	bh=ib4lifFKvSYSy8Pl1r9D9dMsTKl1e3npRyP7jzu7B1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z8t54SEDm38v6x0+unVfLMYpYiS8tU8swAeMnwV3KC2mSVjndwLqMHvw9PC2E/ual
	 fgJdD73rhuCtRy1tTFY+1A0KWyLUl26vuynkaOX4mhbWxj+ujkIgz3aiPjouBAXWXv
	 NjjjXwZJoRCGiUY2G4msIn1FU6n7Lmw7nJMlPRd6sXSeP7uToBxkOLjw1P2EYOzZ9G
	 lvF4QeN+l/MCyxJMssXP9cvdm4T1d7C93fNyRn/0Dnuvxo51pIKnBX1sg6UVcQ44Ew
	 1ShHb0xxRU7hRKl4qQGlqtP2KeF2+gPhROlaYQeuIz/zSSKq6DtRgl4so11aXIbh5T
	 hzvw9aPlndYSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/10] mfd: nct6694: Introduce regmap-based transport
 abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260821033505.4017901-10-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-10-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 03:52:01 +0000
Message-Id: <20260821035201.C1A6F1F000E9@smtp.kernel.org>
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
> Wrap the transport behind a regmap bus and let the sub-device drivers
> reach the firmware only through nct6694_{read,write}_msg(). The command
> header maps onto the regmap bulk accessors by packing the host control
> byte, the module id and the 16-bit offset into a single 32-bit register.
>=20
> Add nct6694_write_read_msg() for the commands that transmit a request
> and read the reply back within the same firmware message, and use it for
> the I2C deliver command.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821033505.4017=
901-1-a0282524688@gmail.com?part=3D9

