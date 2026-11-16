Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851570;
	b=g1HbhgbQxT4qShNCTpj3VsEWUS+TBfz07YslNZ/EEQMDO4o47SWfjyRQGpH7ecvW72lX
	 +M2thIa3oHpCmxx9c3A+83c/qOFjk7ivqtp76W+n60+VNiHmF+sA+wzezFo/waphxw/Ke
	 XfMuzLUR5VS6Sxr3s3Qh2uxZyHyS52fT6NKsmo646PIavdqUg70dMjaTu+YFr2A9GjgkG
	 mYUm7qVc8KNiS/3a404ITWGQywH2c115K1CvRujyGa5uSUVRcsekXxAwQGf2YpIM1ZCAz
	 Z14HLtMP7EhPs0cYhOEjDH/jXdVXUbSEwu68RCVU3T+lQBmAl2SL4sjCvNrTtguhcaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851570;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9az0PZvPVlvi3iV3NddSnYXTbaEn3C6nWn0c6YHu6+Y=;
	b=1sV4E05CnOmZS/n60uXnVLbS3fK3VC82wsBEyR7t9bHd962S/6kWuMAOOhOCEyTLHz/t
	 TCQCXOQOpe8+63nX8E7Jz8zzUhfXniRSvWz4XLeG35heLoQPbdP23dMn87OdAdcEc9ryJ
	 BoFm89xqr7tgGogtXlO5jgikw6NCGUCMTeoK0IJnmOYGoJZpU3RZ6FBIBdZIs9P34MAAj
	 sRlOujtHcPIOus6lbiWH5ZyzY5Sw3HoZjEu2EQqR1kL5NjT3/5d2dTf32dYNCbnJnALMB
	 ryZze/OBv3coVch2kbidxKFCLd2ZVZ4jszwdOZbmHovxjS5/L8lhsjcv29+hzOFASYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2daKrBt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5651B606A88F
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 17:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2daKrBt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCA91F000C9;
	Mon, 16 Nov 2026 17:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851570;
	bh=9az0PZvPVlvi3iV3NddSnYXTbaEn3C6nWn0c6YHu6+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j2daKrBtfQdjMiK2i/ImVYPTZD6jKqP0m04WJwyrf7RySEQLY/2Q5QJLJdJmSQAIL
	 qUzBOEPPMbWNyVhKORjhrFA5SVmqF/kZTAaKtPtUMGrF2YrGxYwfXsME2+tWi48xPU
	 ropYZUzzt0ocXBYXXK4gv8htj3JXOi9XxSHPoc874gEnjTJzypS+xcmZyeJOV/akhX
	 9n8ayGglly8nLlbhke0qjK9ZYzciRyBAcK5rJfav23nuobHN+UZwmauccdOL+JBrz+
	 FMstbk2o3L7iVWgqoQcFcXI/DCNvzkFWhNvhxN2q7+A5jwOSR616Cj0c4XTGRNDdNl
	 O+gLDx2VL/iuA==
Message-ID: <sashiko-outbox-217448@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] pinctrl: airoha: move the GPIO register offsets
 to the common header
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116174854.342912-9-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-9-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:52:49 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The GPIO register offsets are private to pinctrl-airoha.c, which builds
> the shared 64 pin register table from them. A SoC with more GPIO banks
> needs its own table, built from the same offsets and its own for the
> extra banks.
>=20
> Move the offsets to airoha-common.h so the SoC drivers can use them.
>=20
> No functional change.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116174854.3429=
12-1-john@phrozen.org?part=3D8

