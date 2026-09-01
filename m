Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4855C30C617;
	Tue,  1 Sep 2026 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295541; cv=none; b=rHWl2DbdzNf5j1oJgN+Zf7qVLIbJxEdZFVNopkLSdRVM61LaW/M9rkim9o/nM8IeFqX0t5YZth2rl/vWfggtu4CbJeyxrtQ+ZfH4EodEWD3RZbTW4GVvAD23G9g0aasleMgx31KEUnAWzwnFtsHDkU3SnMrhU9WHQIqpNnaaezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295541; c=relaxed/simple;
	bh=V81EX/5ARhTCTT8dVZRwd08K3QOHXeb2fOQBgdE9NCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jMZkjWjBAas0dMEqaF1yPdnOZCN/5Xu9BivV7docCLWw8atYjs2B2NVSdGasRcV4z5i5WvqmhQHNigy9vHdcaB/sw/ML+ACugh5uGInA8iqm/7Js/QmdWUzXGhhiTUhnlSgQAFyBgLPZdrjMmHTfoZBZQMKCZyT9t9UScpDErsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaI5xkVH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaI5xkVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22011F000E9;
	Tue,  1 Sep 2026 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788295539;
	bh=V81EX/5ARhTCTT8dVZRwd08K3QOHXeb2fOQBgdE9NCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WaI5xkVHVl0baU8l6Lt1K1P5QWqg/Yi0GS1b7zCf3Mx3XzK0/1WCYzyDTCISc1bCu
	 VeMrpASstiw3oJeaCJ7zJzCrGOfcgt+Af+DU5WDAiuLsdDQOYmxpD8hkiiK9c1aWdl
	 E0gchAT1k5BhuRugdcrbCTwulbDxXdoishex3HITwPopkgP1S5jyqvxrDUPcOU2ILS
	 /aPlG8DpCYcG4cqIDL8jg9ppIH2KoqG4j8yx6zuvzm235O5S2lBAjGBLjHbgC4+zgp
	 1l32EilXwavB9qoXHlFXeNuAtdu9zukEXE7j7WlsHINARmVdnKsyup/dyyyucZsbNt
	 HzKVXSpxxqhUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/13] ARM: dts: ux500: Fix up regulator assignments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-13-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-13-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:45:39 +0000
Message-Id: <20260901204539.A22011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Several Ux500 device trees use DB8500 power-domain regulator nodes for
> supplies which actually come from buck converters in the AB8500 or
> AB8505 PMIC.
>=20
> Assign AB8500 consumers to VSMPS2 and VAPE and AB8505 consumers to the
> native VSMPSB and VSMPSC nodes. Use the common 1.8 V I/O label throughout
> the reusable HREF board descriptions shared by both PMIC variants.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D13

