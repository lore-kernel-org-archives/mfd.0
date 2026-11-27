Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792046;
	b=wJB48YgcmmyBiQ4wEjNVRihk6MoQui3qxACTjPh6PpaOmShGaHqL7kaRNQf8zqseNhFG
	 272zPJgpgue6kYGr4XReqvUOCtrQHv04eNuHN/2Q6erXbW3NgGENO7CHYql+fq+HXJCel
	 Pz463d49llikyo66ONB3/nHhTELRjmqD93oZ4bWqX9On5h99fELQ0Jo5Y4lkaepJ7BSXd
	 2lObLZlseO3FM0WaiqjXaOFf3MYq4Sk2mteA2+QE4VgCmOtuf3K+A9rBzWeKlelwTj9+z
	 PzzoIhvWv2nmOKw0pd179qROzycfpyHzepXsjbclS0uXg5deO+WtE8gbz7orHKm22Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792046;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=aTyAya1d1zqdX8GTspb3iJbYPHLH49K6JMnaMt5ObMc=;
	b=BNH2NJd7nPijE3nOz/1jK1xxa7UZkFMSn+CSRgXraPsIU6A00Da1gG1RVHKzVU8iZG94
	 L64Vis4o0FDFx/Tg9dlgqQpozmimnMB04tcUaAd/dV0clyryOl9Yo80vlrCDOWYIVIOLH
	 /+gCkCKHSJW26WxZZn+XA7RJiALfIl5loOwBSWB1g+GQ28oxicYxCQqLBrZ9TKRF6ToaA
	 Q69WnCSnJTBIP2OAGOOziJiccRLUGS0HdOcHpWzr/vkYNBPrcApadEwWPbNEqagD4ZdWw
	 QUg+jO/1JAcw9y/e7oF/gKvZ66xD5ldHev/sj7GJGF0xZk7SsxEFiaPnOfCXaO42TMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzPfB6Hb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842B8606A31E;
	Fri, 27 Nov 2026 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzPfB6Hb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB481F00919;
	Fri, 27 Nov 2026 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792045;
	bh=aTyAya1d1zqdX8GTspb3iJbYPHLH49K6JMnaMt5ObMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lzPfB6HbaDwJ2td2ml4g6OvwLHYFRM1I1iWTRkA61A2PFG6oKvGgtEyLdBVwaz5m3
	 0ygZonSU39vbFTwPMXw7kYpXwCGBWQJq+HC92kCngOg+yU9NsTwmnKIhagSav1krfX
	 g0zCkP+Vyc/bJIGfNbpnXOmNxxW/aPl3U1VDbwk/PmuYdxML4MGwUp6EWe1mImohkC
	 3mU9ZBvvW0YDE2BPJdTjaK2fwo66sbcGIA5LHiTAximbo0yVi89CYZFISrHWXoTjQJ
	 YFexxJHS1klmAjXpsPr69DpZHfiC0s9PcfLwFlHn9SONhOcdnfrpTZVf2R8hlGEURG
	 AtLBuxqtd/zVg==
Date: Fri, 27 Nov 2026 15:07:15 +0000
From: Lee Jones <lee@kernel.org>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: stmpe: Disable regulators on probe failure
Message-ID: <179568586298.32537.18171310345438853843@kernel.org>
References: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>
X-AI-Review-Draft: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>

On Sun, 22 Nov 2026, Haoran Wang wrote:

> The VCC and VIO supplies are enabled in stmpe_probe() but were never
> disabled if probing failed later, leaking the enabled regulators.
>
> Register a devm action to disable the supplies, and track whether each
> supply was enabled in dedicated flags instead of consulting
> regulator_is_enabled(), which reports the hardware state rather than
> whether this consumer enabled it.  Drop the manual regulator_disable()
> calls from stmpe_remove() so the supplies are disabled exactly once via
> the devres action.
>
> Fixes: 9c9e321455fb ("mfd: stmpe: add optional regulators")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> ---

Changelog?

>  drivers/mfd/stmpe.c       | 24 +++++++++++++++++++-----
>  include/linux/mfd/stmpe.h |  2 ++
>  2 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index fd51ba74275c..fb30b8a4fbac 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -1362,6 +1362,16 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
>  	}
>  }
>
> +static void stmpe_disable_regulators(void *data)
> +{
> +	struct stmpe *stmpe = data;
> +
> +	if (stmpe->vio_enabled)
> +		regulator_disable(stmpe->vio);
> +	if (stmpe->vcc_enabled)
> +		regulator_disable(stmpe->vcc);
> +}

Yeah, this is worse!

Instead of manually tracking these, why not use devm_add_action_or_reset() for each?

    static void stmpe_disable_regulator(void *regulator)
    {
            regulator_disable(regulator);
    }

Then, when regulator_enable() succeeds:

    ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulator, stmpe->vcc);
    if (ret)
            return ret;

    ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulator, stmpe->vio);
    if (ret)
            return ret;

>  /* Called from client specific probe routines */
>  int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
>  {
> @@ -1410,13 +1420,22 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
>  		ret = regulator_enable(stmpe->vcc);
>  		if (ret)
>  			dev_warn(ci->dev, "failed to enable VCC supply\n");
> +		else
> +			stmpe->vcc_enabled = true;
>  	}
>  	stmpe->vio = devm_regulator_get_optional(ci->dev, "vio");
>  	if (!IS_ERR(stmpe->vio)) {
>  		ret = regulator_enable(stmpe->vio);
>  		if (ret)
>  			dev_warn(ci->dev, "failed to enable VIO supply\n");
> +		else
> +			stmpe->vio_enabled = true;
>  	}
> +
> +	ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulators, stmpe);
> +	if (ret)
> +		return ret;
> +
>  	dev_set_drvdata(stmpe->dev, stmpe);
>
>  	if (ci->init)
> @@ -1489,11 +1508,6 @@ void stmpe_remove(struct stmpe *stmpe)
>  	if (stmpe->domain)
>  		irq_domain_remove(stmpe->domain);
>
> -	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
> -		regulator_disable(stmpe->vio);
> -	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
> -		regulator_disable(stmpe->vcc);
> -
>  	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);
>
>  	mfd_remove_devices(stmpe->dev);
> diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
> index 87e29d561e22..eec5fc795014 100644
> --- a/include/linux/mfd/stmpe.h
> +++ b/include/linux/mfd/stmpe.h
> @@ -122,6 +122,8 @@ struct stmpe_platform_data;
>  struct stmpe {
>  	struct regulator *vcc;
>  	struct regulator *vio;
> +	bool vcc_enabled;
> +	bool vio_enabled;
>  	struct mutex lock;
>  	struct mutex irq_lock;
>  	struct device *dev;
>

-- 
Lee Jones
