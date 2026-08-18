Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57F43BF68D;
	Tue, 18 Aug 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043800; cv=none; b=heAW5AfyaBco1vhC4rsnipcoGdUem3tE8z6QuNXnsti9mJw7ATc0JxuH9ixUX6rDaUe3A3DKcZsq0nOAQjtxrimoR/o7AOQv9VcOXZrNDamxkfigOOrF7f/KWEpjEIK6UlIb58O/BJVy5bg6fBdZWEQNknuFD/UFmzm2JkcokcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043800; c=relaxed/simple;
	bh=X6ZUlZ2eRj5ykhhbndt5dN+jpbenTUwG9iRSnzcgZ3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VDVa4ntfker96BiYm1skAWs6g1IL7FXWUO/c+T4Nd3uj98K3aAXjsam8m29mmAbq/3/D1QKg7j4y9r9irMeeHD9c4W0OPZxeBgRDEoTdo6SHZ0T8JDQQRK9oS1MvW5yFDqX6FnxA63UbDeaDsIRA+AfJArQ7FMLiTBg67XqJf10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiqdFYqa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiqdFYqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0277A1F00A3A;
	Tue, 18 Aug 2026 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043799;
	bh=X6ZUlZ2eRj5ykhhbndt5dN+jpbenTUwG9iRSnzcgZ3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AiqdFYqa4XRsLs0Jf0W/8CU0rsX7EicGJUEFYh2K0PO2omQg/h1rnbzWV/u5CLoKJ
	 yQepQPfGED4DdqxgQ/tefNfiLZCwupCTW9KJhXbVUhUDaoVNN/Rqh0pTAbhqiSJZNk
	 +InZ2mC32PflMNyC2xcHMEAjrGZLVqn/67vi1Ll6OIFZ+AkwA7QpqJsdcCJue8QOGP
	 hpjXydJcU0WdOHewJPqbeEgQSa9QZWkYBS6Ct8F40npdL3Pa7JpTJ3RHHOr1BuaRCV
	 SSCsjreH3K34FjFdbomAcRujjFWVQmXYcuGcXul4CEhpELVip7lGVoJZnR9NUHKxM8
	 d3rg4wtlxPHSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 01/10] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260817082034.20326-2-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
 <20260817082034.20326-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:03:18 +0000
Message-Id: <20260818090319.0277A1F00A3A@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082034.2032=
6-1-ansuelsmth@gmail.com?part=3D1

