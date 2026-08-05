Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E284145D1BD;
	Wed,  5 Aug 2026 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932735; cv=none; b=r3wO2ZAvoV/Lo0Jya6G6TtdUISt5N80bMpJf8Ewof8KjkrvbdOHKu5FwfA8fzfD28Ae9UjU0NcQ73QyohaBhT8Q5+LcRJwdVJ9jbY2xbfrWPEAcSsRbLR+lOxW8+N8bzX/1tlTVcapF6X0T+bhosYjk8RmedOTztxF2kshg3D2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932735; c=relaxed/simple;
	bh=W1d6pTGcyFOLfRHtz7TAZXQKY0o/L/01e6zbO9QTaJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l6LX533aKSDkz9mUQX4hE6VOCC/jBTo4NhdyH6vbFTx+ZQJmXHSSqg5x9j+jyk8aJh/uNdSqqS6osFoo9oeg+L3rXMbruxbCeGm7jgHeEzZS8UozeRrFzKGeY0lnSFgt7JkNxksDi/wQSEmQJAMiSMPOjZN610RtDQU8/zzV4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPI6qhPM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPI6qhPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6481F000E9;
	Wed,  5 Aug 2026 12:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785932734;
	bh=W1d6pTGcyFOLfRHtz7TAZXQKY0o/L/01e6zbO9QTaJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hPI6qhPMBFVUPG2W0PLeFud628k3fZOqaCstPUPRk9V8hIpdppOIp74Yrv7Afozt2
	 cB370aMysAFOd6YgZe408/pNfH8UG101m3Jq5nuZiqdiaOO8E2MRS/n6B3gB+KZ0UK
	 fn8Y7yE2EDkT3m2kUfv+Ih2qksIOTxs5iXAMc5/tgl2ppaeQ4JjxQAekowPKSQr1VF
	 M85Tk4OGqhI/c45RueRzoWT+Ep33fcMTIa+jEwnWtJRK0Fkl4Bb3shARY+Smh7YcfD
	 lj0azbotRhJnbhhlRulCZMFzJFB28Nz2kY/aVMDSF+TXru6MGmi77lRbh/pEegzeTd
	 drdCIkttERQzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: serial: 8250: aspeed: add ast2600
 and aspeed,vuart-over-pci
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <52d5bce1cf8ec3ff0b27e7313655cf7ffa2236b5.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <52d5bce1cf8ec3ff0b27e7313655cf7ffa2236b5.1785932211.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:25:33 +0000
Message-Id: <20260805122534.6A6481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The ASPEED AST2600 has 2 Virtual UARTs accessible over PCI.
> The ASPEED AST2600 can be used as a PCI device.
> 2 Virtual UART can be exposed to the host via this PCI device.
> These are 8250-compatible register sets and can be used to have UART
> communication between the PCI BMC and the host.
>=20
> This boolean can be set to specify if a VUART is used over PCI. A VUART
> over PCI needs a syscon phandle. The syscon gives a regmap to the SCU,
> which is used to set the enable bits of the PCI device.
> On the aspeed's chips, the clocks phandle already points at the SCU node.
> But deriving the regmap from the clock provider would misuse the clocks
> binding. An explicit syscon phandle states the dependency directly.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785932211.gi=
t.gregoire.layet@9elements.com?part=3D1

