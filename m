Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D13EC804
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941409; cv=none; b=O39gH9uPEXml25ydSeN1S9XYMUf5J0dNlGtVZ1cbkzFJutC6pszA7ZyYgh0hyg8S0D2BKAaMZOyHk+X/bAFDZbmZgYkBHjjcfCz572TmfJoqkqUMsfX65MSimOau78ddJFW4L/03CTyGYiBNaEXEpk6kxzF1TdIpthXZqlZG5HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941409; c=relaxed/simple;
	bh=hNKdcoIy3M0bFcs/nyJh6wJ4mQlvN76DDdGyym6BWNo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UlpJFNUsNL5Ag0M+Z3z+wWxb7WVM26Nncr+ffcxRr2ZdEtNlakK2BH9yFRN80cfWiE7V7uSOUONEmNXGLYBBxHkjj9nrTpCNsjHpGUYMc79Is8GKfl/D7QsLNYllpAEb/Lcl7shk+6DVWIo+Blpc9hfmuEgnlPX9trEXWOV+x+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjhpPvmY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjhpPvmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8047E1F000FF;
	Fri,  2 Oct 2026 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790941407;
	bh=hNKdcoIy3M0bFcs/nyJh6wJ4mQlvN76DDdGyym6BWNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZjhpPvmYsmmHeZfB2kbH9is0+kVDPWa7rXmPRlljfm6AZ92Lcu1kxqBlrTiXRer5v
	 PctbEYce8LTKzp9OY/H+tjN9oAfgIOmgrqlM0srTnnljNUJ9Lr8E2nBRIYmm577aQg
	 ulokdb3KN8pD00ZtgiVsV3lPI3CkLeP+1X6JJn83d6UoiOFtj4CHlikHSAN+zvrSNM
	 fTjkavepbkE/iVcyNRbsRuLnexDziQwBIcKuxKqFw6Fafntw5tiyyXH1sTPcTikVBJ
	 A/yow+D3sczpb0qAvULjqDrCRtGN3Gmvjbn3/JEW5b4B4CK6QSxbrLxDxfHG8JyztZ
	 kME3NTRFA281w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] mfd: tps65217: Check return value when masking
 interrupt sources
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261002113624.178588-3-r.zhambakiev@prosoftsystems.ru>
References: <20261002113624.178588-1-r.zhambakiev@prosoftsystems.ru>
 <20261002113624.178588-3-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:43:27 +0000
Message-Id: <20261002114327.8047E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
>=20
> tps65217_irq_init() ignores the error returned by
> tps65217_set_bits() when masking all interrupt sources. A failed
> register write leaves the driver's software mask out of sync with the
> hardware and may result in spurious interrupts.
>=20
> Check the return value and propagate the error to the caller.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: 6556bdacf646fcaa ("mfd: tps65217: Add support for IRQs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002113624.1785=
88-1-r.zhambakiev@prosoftsystems.ru?part=3D2

