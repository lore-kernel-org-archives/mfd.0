Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099D23655FA;
	Sat, 26 Sep 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426749; cv=none; b=Nh10on1s04gcLdwpSP76NgU/4PSdSP0gPBcX9d6aAbfiU0g02pCcB3WXGEApTOWo3kXPskBgiR/KiAsCuvDYtigEy6xsp9Qgybz9SYQf3A56JzeGRA5pkYEmEyh0zd+dgloJDRnXcgqLfrr/VrpV9YavK48V4NT+jU7cmZOw7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426749; c=relaxed/simple;
	bh=qSVTH3hKApC+G0NNfCmYtqjrBIMoZxXprlyfJeHNGAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tukGtM5OYu8+R6PPLVGq4KJJkE0X7wYfT5EYb9j1zhjT42fgqoG26+jQEFScba3iK9kI2hUobfONnSrMLwYywAHLU3BbjrjlCNYPi7hrBXM+ZAcwOs/qJgXTHsnS5y6F3MlcWOLOFr+XD02oR6PsKiv2eun4kfcX7t/vCk+FiYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKosisYx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKosisYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E71B1F000FF;
	Sat, 26 Sep 2026 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426747;
	bh=qSVTH3hKApC+G0NNfCmYtqjrBIMoZxXprlyfJeHNGAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FKosisYx1+7D6Mnwx1Fm59CowTxX6uyZBJ//RopknjgDI/ww6qpfzqneMc8KZm68W
	 ANLt7SsuS+ZVdkMrOps+hJeH+5u+tGuvj2/SsE1+e3+YNOI9nzzmLBQxtBA4GvwaTN
	 N1JQbg1W6PHnO/hDX+pqHT8e0pp4YJmS7w3yArsX1Xba9+BRMLj1WwDCS6CXD4xWz4
	 8VKV2h3YdNyS1ju83adXvM4OCX0RODRdCUjcolDV97GeqpAYkFuMfk0RBCdcFJdr7W
	 N1FLoR2fhZvWSajaUBnUyvBelf5dGMB96UrHcaNge6hDTma5I1HXxD866rc5EanaLP
	 fVBynvjwbNDKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 01/12] usb: typec: tcpm: qcom: Release the connector
 fwnode reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260926-typec-v1-1-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-1-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:45:46 +0000
Message-Id: <20260926124547.2E71B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> device_get_named_child_node() returns the connector node with its
> reference count incremented, but the port probe never drops it. The node
> is only needed for the VBUS regulator lookup, so release it right after.
>=20
> Assisted-by: LLM
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the=
 connector node")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D1

