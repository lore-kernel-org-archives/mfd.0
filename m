Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAC02E7380;
	Thu, 16 Jul 2026 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216887; cv=none; b=tzV26YMIoqdVKfd8qmhQBmYh9GBS5SRUI8umpKN1f8UKI3Vz8umMuWbLeX3jdI9md84dLb8C/L52PWiVS382T7xOVO7aFlJ1qWa173PiRmw+11eudXjfglkxJyABXqa/gtt7s1JLD2z7qDQd6RQYG5aj3PhL7Vl8ePTeP/XJYGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216887; c=relaxed/simple;
	bh=QTtH/GEBGvT4FUJZMbHawjtYCJ9L+eJohoWad3c//zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gn/zW1+uMXSFwmm4RrHtJLp0AVqTCV4uio9WI4nc8cPQRX6QBYmYcBSN7VEVVz6P2B80bQoTEGVI91IjF2TT7oPncbZs6Cmi7esxH7BhIOQKwQ49Bu5altMj4SJHiOHuN0ATIbcA00oFmlRwQv8DWRZckJwPDBHhO0xo3s2vUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ajbw2J+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ajbw2J+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3091F000E9;
	Thu, 16 Jul 2026 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784216886;
	bh=lHGOcVK+a7ZN4H56NffT14nmHA7iVj9KHhx0POErQPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ajbw2J+ce3aXmn/2opI/ZNuKUMUNcoEwCG7XESsQMYZdUk2tRTUP9f8TnQKMULrIk
	 IUXzq0+8d11yJnwmXSO5BRxraHnr+0AHGuw/IXEXctG5XmtXwFv2rbzmLZsOJqPwPP
	 ZA2rbeUQiEyvsW0kDDlZq0U++1vqbnXa3wv3y16ajti1jUscWAJaNMCgxVJgb6PiQO
	 VIPjm/nmZIPi15elZ3qScj7eY8gph7SvIH68KJNMqbi4q/ClOCWyukfxStdPNhkEJi
	 +1P4h/biZjJUwBmAcUJjWpPmVfFZiWRxKZMSvxL+oDu69TEyEZ6mrBKhjPYevBGhQU
	 nrXa00Yv51rqw==
Date: Thu, 16 Jul 2026 16:48:02 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: ucb1x00: Convert Assabet gpio-keys to use
 software nodes
Message-ID: <20260716154802.GB1424265@google.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-2-e6271ea3d3dc@gmail.com>
 <20260716130604.GI1260374@google.com>
 <aljznJ3Vg69a0V59@google.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aljznJ3Vg69a0V59@google.com>

On Thu, 16 Jul 2026, Dmitry Torokhov wrote:

> On Thu, Jul 16, 2026 at 02:06:04PM +0100, Lee Jones wrote:
> > On Mon, 06 Jul 2026, Dmitry Torokhov wrote:
> > 
> > > Convert the legacy gpio-keys platform device on the StrongARM SA-1100
> > > Assabet evaluation board to use software nodes and device properties.
> > > This allows describing the buttons and their GPIO bindings via software
> > > nodes so that platform data support can eventually be removed from the
> > > gpio-keys driver.
> > > 
> > > Define static software nodes for the gpio-keys device and the six button
> > > child nodes at file scope using relative pin indexing on the UCB1x00 GPIO
> > > controller node. In ucb1x00_assabet_add(), register the software node
> > > group and use platform_device_register_full() to register the device.
> > > 
> > > Assisted-by: Antigravity:gemini-3.5-flash
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/mfd/ucb1x00-assabet.c | 124 +++++++++++++++++++++++++++++++++---------
> > >  1 file changed, 98 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/mfd/ucb1x00-assabet.c b/drivers/mfd/ucb1x00-assabet.c
> > > index 6a389737c615..ee49ac779d1a 100644
> > > --- a/drivers/mfd/ucb1x00-assabet.c
> > > +++ b/drivers/mfd/ucb1x00-assabet.c
> > > @@ -6,15 +6,18 @@
> > >   *
> > >   *  We handle the machine-specific bits of the UCB1x00 driver here.
> > >   */
> > > -#include <linux/module.h>
> > > -#include <linux/init.h>
> > >  #include <linux/device.h>
> > >  #include <linux/err.h>
> > >  #include <linux/fs.h>
> > > -#include <linux/gpio_keys.h>
> > > +#include <linux/gpio/machine.h>
> > > +#include <linux/gpio/property.h>
> > > +#include <linux/init.h>
> > >  #include <linux/input.h>
> > > +#include <linux/module.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/proc_fs.h>
> > > +#include <linux/property.h>
> > > +#include <linux/slab.h>
> > >  #include <linux/mfd/ucb1x00.h>
> > 
> > Should 'linux/mfd/ucb1x00.h' be sorted alphabetically along with the other
> > header inclusions (e.g. placed before 'linux/module.h')?
> 
> Maybe, but I did not add it here...
> 
> > 
> > >  
> > >  #define UCB1X00_ATTR(name,input)\
> > > @@ -34,50 +37,119 @@ UCB1X00_ATTR(vbatt, UCB_ADC_INP_AD1);
> > >  UCB1X00_ATTR(vcharger, UCB_ADC_INP_AD0);
> > >  UCB1X00_ATTR(batt_temp, UCB_ADC_INP_AD2);
> > >  
> > > +static const struct property_entry ucb1x00_gpio_keys_props[] = {
> > > +	PROPERTY_ENTRY_STRING("label", "ucb1x00"),
> > > +	PROPERTY_ENTRY_U32("poll-interval", 50),
> > > +	{ }
> > > +};
> > > +
> > > +#define UCB1X00_BTN_PROPS(_idx)						\
> > > +struct property_entry ucb1x00_btn##_idx##_props[] = {			\
> > > +	PROPERTY_ENTRY_U32("linux,code", BTN_0 + (_idx)),		\
> > > +	PROPERTY_ENTRY_GPIO("gpios", &ucb1x00_gpiochip_node,		\
> > 
> > Where is 'ucb1x00_gpiochip_node' defined or declared? Should we add an 'extern'
> > declaration or include the relevant header to prevent build errors?
> 
> We did. It is introduced in the previous patch and is declared in
> linux/mfd/ucb1x00.h

Ignore the two above - they were "assisted" and I forgot to tear them out.

> > > +			    _idx, GPIO_ACTIVE_HIGH),			\
> > > +	PROPERTY_ENTRY_STRING("label", "btn" #_idx),			\
> > > +	PROPERTY_ENTRY_BOOL("linux,can-disable"),			\
> > > +	{ }								\
> > > +}
> > > +
> > > +static const UCB1X00_BTN_PROPS(0);
> > > +static const UCB1X00_BTN_PROPS(1);
> > > +static const UCB1X00_BTN_PROPS(2);
> > > +static const UCB1X00_BTN_PROPS(3);
> > > +static const UCB1X00_BTN_PROPS(4);
> > > +static const UCB1X00_BTN_PROPS(5);
> > > +
> > > +static const struct property_entry * const ucb1x00_btn_props[] = {
> > > +	ucb1x00_btn0_props,
> > > +	ucb1x00_btn1_props,
> > > +	ucb1x00_btn2_props,
> > > +	ucb1x00_btn3_props,
> > > +	ucb1x00_btn4_props,
> > > +	ucb1x00_btn5_props,
> > > +};
> > > +
> > > +struct ucb1x00_assabet_priv {
> > > +	struct platform_device *pdev;
> > > +	struct fwnode_handle *keys_node;
> > > +	struct fwnode_handle *button_nodes[ARRAY_SIZE(ucb1x00_btn_props)];
> > > +};
> > > +
> > > +static void ucb1x00_assabet_remove_nodes(struct ucb1x00_assabet_priv *priv, int n)
> > > +{
> > > +	while (--n >= 0)
> > > +		fwnode_remove_software_node(priv->button_nodes[n]);
> > > +
> > > +	fwnode_remove_software_node(priv->keys_node);
> > > +}
> > > +
> > >  static int ucb1x00_assabet_add(struct ucb1x00_dev *dev)
> > >  {
> > >  	struct ucb1x00 *ucb = dev->ucb;
> > > -	struct platform_device *pdev;
> > > -	struct gpio_keys_platform_data keys;
> > > -	static struct gpio_keys_button buttons[6];
> > > -	unsigned i;
> > > -
> > > -	memset(buttons, 0, sizeof(buttons));
> > > -	memset(&keys, 0, sizeof(keys));
> > > -
> > > -	for (i = 0; i < ARRAY_SIZE(buttons); i++) {
> > > -		buttons[i].code = BTN_0 + i;
> > > -		buttons[i].gpio = ucb->gpio.base + i;
> > > -		buttons[i].type = EV_KEY;
> > > -		buttons[i].can_disable = true;
> > > +	struct platform_device_info pdevinfo = {
> > > +		.name = "gpio-keys",
> > > +		.id = PLATFORM_DEVID_NONE,
> > > +		.parent = &ucb->dev,
> > > +	};
> > > +	int ret;
> > > +	int i;
> > 
> > Nit: If you re-work this, please declare inside the if ().
> 
> You man inside "for ()"?

Yes, for (), sorry, long day!

> > 
> > > +
> > > +	struct ucb1x00_assabet_priv *priv;
> > > +
> > > +	priv = kzalloc_obj(*priv, GFP_KERNEL);
> > 
> > Why _obj() here instead of the usual candidates?
> > 
> > What about devm_*?
> 
> This is not a driver in the sense of device core driver, so devm would
> not work.

Oh, I see now (just went and read through the history).  So this isn't
an MFD at all.  It should probably be converted to MFD or moved out at
one point then.

-- 
Lee Jones
