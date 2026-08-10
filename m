Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DB93AE6E5
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365364; cv=none; b=JoSnNtujy9pmxxfwnwlLA+EbaxNInrlSTTaFhC/O25VDftHPRS94Wi5GdG4J4KKYoIy4kS8vG/a1uGbggjDm5OxyA7vYFDZU48f+fM0mQnyUhUOIse85aqHMTdZmbQZsNtjCztklBndFVkb2jNrjO9Y11+lfDjHoDi55akHPGx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365364; c=relaxed/simple;
	bh=J6+FhiJEu3RPfLDe6ZxFWwLQJK9FfVxALZIQN1s+ptU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jpnarn2qiiI1AB0yp3ai0II1Tj2yCWXmmYIH61vanIeKfu9DeKKAz31ubiD/A9eV3TNtltXfiEAhNCueomXU4hJV0DRiLol4/PsklAEZXo1i7up3wFjMk9HLscSZScJ2/NYO51owLwEEuZwXoUwYeHNyXX1m4CwG5dOYqC30Z/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFZW5OTk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFZW5OTk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3451F000E9;
	Mon, 10 Aug 2026 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786365362;
	bh=J6+FhiJEu3RPfLDe6ZxFWwLQJK9FfVxALZIQN1s+ptU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OFZW5OTkyz99BN7UJo1F1V8AzeuY7hau05EwCYj1tE9tn0r2bKjatkLZTwDQeM5kK
	 0zDdGGeo/RZ+j30GRW8TuJ9C/L5dFezgo5tVjzanF7pZ+tmZR3mAEC6M0CIX4EjTB2
	 7WvT60mIuXtqCc+0RnFUt/xmvWQZoHGeW9XvykOD7vZDuI5l+m+j33aVrx1wSRaBvV
	 Px9N/MZa3HL+TEOC3x7yyOhMXPBTcGvUIupxnmm4QQX/dW9Ed1IGWeUawUbGq6tmN5
	 2l+3wzyR+ieXKKdjHP7Mri159DdnACddgl+JxmqoSXKmgeCNdKot52mdlNv6gGalUn
	 6yEyLDqF2JghQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 5/8] ipmi: ls2k: adjust dependency to its mfd
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260810-ls2kbmc-mod-v7-5-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
 <20260810-ls2kbmc-mod-v7-5-8aa0fb5a5462@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:36:00 +0000
Message-Id: <20260810123602.4F3451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Miao Wang <shankerwangmiao@gmail.com>
>=20
> There is functional dependency between the IPMI driver and its mfd
> driver. Previously, the dependency was set to "select" from
> IPMI_LS2K to MFD_LS2K_BMC_CORE. However, the ipmi driver is actually
> compiled as a part of the ipmi_si module, and IPMI_LS2K is a bool
> option. Therefore, the dependency "select" will force the mfd driver
> to be compiled built-in when the ipmi driver is built as a module. This
> is not desirable. This patch fixes this by declaring a conditional
> dependency from IPMI_SI to MFD_LS2K_BMC_CORE if IPMI_LS2K is selected.
> This will allow the mfd driver to be compiled as a module if the ipmi
> driver is built as a module. The adjustment to Kconfig for the mfd
> driver will be introduced in the later patch in this series.
>=20
> Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v7-0-8aa0fb5a5462@gmail.com?part=3D5

