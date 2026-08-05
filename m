Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F803E0C5C;
	Wed,  5 Aug 2026 08:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917794; cv=none; b=Pc0MImM1Nzk/rpYMth57eArIwXkGq0cP05ypEc2Hu5W1ahQ3P9VNIfLBPW2ZqqsHn05UUyuNohscmfdyQxvPGnyNeYOikdbASV8c4CJMR35OEutgo6Vhhkjw6B7gm/D3EufebupF7n4Yfg687eLJCJZUo0UQLRRzB9VyefRxQ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917794; c=relaxed/simple;
	bh=G9Gi4+sJry7WTdexIjEbq8Fhzl/xRk/89sijuaG5frM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OypHyPYHkiJdCc2KQsUrbhKXq62jknep+BcWSwqcFqNMSGrsJgko8II81TxX1H+jMvkGn7ILgwvIA5oT8DNCXsxPLbe72iE5u8kjZTNxYTfKCE/x6byMsAyE0SWKtfYi5/KHnbwxsFT96TkuBtCne0EptttBJJqmawdecJQmyu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGrgIcuJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGrgIcuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2351F000E9;
	Wed,  5 Aug 2026 08:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917793;
	bh=G9Gi4+sJry7WTdexIjEbq8Fhzl/xRk/89sijuaG5frM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kGrgIcuJXVVwW51VdT9zNdUoIl7FNDSxWbf388pbstL42LpXS0ZKNzjhMma2mplOa
	 vOSBLHFwL5YrQLk5WwlBdGFcCJfHgIJCN+OttUVS8FWsw6gMMUT5MHT7rlI09C1WGl
	 LBQJtHkLS6EYSL5T7YpVQOClGDkU7Ew2EfEHElpiRD1FqIvMrzdR+F5lzxBdH0khdi
	 jUetfiB3bIPuxmHRuAq4TAYt11fQXgwyeeLW3E9VQuUOgOFz/4EKP7qQ6UbIM9DHn2
	 lRuZwLpZ5Rq+iFrwRlgFT+esiGNZ1ec8XZcmXcDdFkNZpTnM66/SBB09aQc+i2v2nR
	 ssa8BAHclPzvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-2-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-2-75df78710b9e@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:16:32 +0000
Message-Id: <20260805081632.8A2351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Convert khadas_mcu_fan_cells[] and khadas_mcu_cells[] to use the
> MFD_CELL_NAME() helper macro instead of open-coding the struct
> mfd_cell initialisers. While at it, make both arrays const since
> they are never modified after initialisation.
>=20
> This is a pure cleanup with no functional change, done in
> preparation for a subsequent patch which will need to attach
> platform_data to the fan cell.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-add-mcu-fa=
n-khadas-vim4-v9-0-75df78710b9e@aliel.fr?part=3D2

