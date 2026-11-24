Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513813;
	b=xAI2zEI5oeStLb5HCFKYfPeKGg4CbC1ECVM07H1b38dm9NQRkbBK1ikQTcdT0VgCgE8i
	 NPLu0suqHByoqZRI7MUF+ylrC3acuPdfRACOKsPKJS2N7pQKexw1OtNasTI05sRlu4usb
	 g9DQ69wjxnzi+3DvPQH9ZlcffTxmZTh+gQm2IJwIQIzUKczGz7XA371/lg8Hl0Kbepo8G
	 aN3SZlvndAWhjC1X4CmOkbxphCUaNX8jm0fyNnXjeMr2uwj9juvKzJSfgBBq77lH77xnv
	 O5uHwODG/MoJOcuqbnnx/kgm3G3AzGAAI73SOZvsG5Oi//K4xJVkwJASIw+cfJBaiJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513813;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GbWs2ApvllvRvBPiANXMDm2r7gvpFKIGMTnMUN9h+Ik=;
	b=BGW7xR4vfBwvtsRXKly+jFPooMTas5LLXbUNOgS1S+CDEANIiQ2NmD94uFPVbJObxkYb
	 LvquBlepTbDl9LgyxGAvrkCdhIWpyDsy6UxVBv3f+iTloU35Aco1QS2NoqYeIdzaMDvnn
	 /NcZb/nyPVj0Rnv6ydkzAsPFOfwKG3/gPgArCelzsUFm43VF0F2hY6HCXTtKukWNZrKdm
	 Fc5umDMFCemyCTZlNrgHx32DH4Q7XwfoqoJUqvtoZvGWGR+VrEl+ZR30qhpr2H/Ab4f0X
	 CkqNOc93WBBK5SWgLAL4kgnR5HA5d9f5pbXSYEuW7AIvQQ6za8bHTNzQ1obVjL9u5mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XR2wWTSZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EFE606A6B3
	for <mfd@lists.linux.dev>; Tue, 24 Nov 2026 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XR2wWTSZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052491F000CF;
	Tue, 24 Nov 2026 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513813;
	bh=GbWs2ApvllvRvBPiANXMDm2r7gvpFKIGMTnMUN9h+Ik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XR2wWTSZA6hNxeEIVJAdmrGcLDOQ1FXU6Kzk7B6emfboAuJ1w9tbcgsQkiY5Z7EaM
	 JAnjvZKoU2xDy0TWDhH1mGpEQTGFbA1Eef692O1nMwWrsOeeMcH9Q3kt0Qwo5uOXNi
	 CXqc6KIWMlGtqZV1bXfMbnE65XKu3PwW6/O3gl2P4FA5/TNk9Fpds1WVtzwlXw82aJ
	 n3Kta33tD7zhd16eu9ULHcVKxOQaHOkJKLb0YwM2gEU6FCp7YR2HqP/V14YeVW079t
	 +YmZnT9Q1LaN9/wsAXfZAXn5Q9TBW0RpyBBV8S4r0OTopoFCd5INqiyF2l4rUQ/Asq
	 BtaIUvvuK50Cg==
Message-ID: <sashiko-outbox-230885@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 0/9] pinctrl: airoha: add AN7589 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261124094059.3882014-1-john@phrozen.org>
References: <20261124094059.3882014-1-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:50:12 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 9-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124094059.3882=
014-1-john@phrozen.org
